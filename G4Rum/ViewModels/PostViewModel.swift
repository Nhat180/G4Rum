//
//  PostViewModel.swift
//  G4Rum
//
//  Created by Maxx Trần on 12/09/2022.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

class PostViewModel: ObservableObject {
    @Published var posts = [Post]()
    
    private var db = Firestore.firestore()
    
    func getAllPosts(gameID: String) {
        db.collection("games").document(gameID).collection("posts").addSnapshotListener { (querySnapshot, error) in
            guard let documents = querySnapshot?.documents else {
                print("No documents")
                return
            }
            
            self.posts = documents.map { (queryDocumentSnapshot) -> Post in
                let data = queryDocumentSnapshot.data()
                let id = queryDocumentSnapshot.documentID
                let title = data["title"] as? String ?? ""
                let content = data["content"] as? String ?? ""
                let username = data["username"] as? String ?? ""
                let createdDate = data["createdDate"] as? String ?? ""
                let totalComment = data["totalComment"] as? Int ?? 0
                return Post(id: id, title: title, content: content, username: username, createdDate: createdDate, totalComment: totalComment)
            }
            self.posts.reverse()
        }
    }
    
    func addPost(gameID: String, title: String, content: String, username: String) {
        let currentDateTime = Date()
        let formatterID = DateFormatter()
        let formatterDate = DateFormatter()
        formatterID.dateFormat = "yyyy-MM-d HH:mm:ss"
        formatterDate.dateFormat = "d/MM/yyyy"
        let postDb = db.collection("games").document(gameID).collection("posts").document(formatterID.string(from: currentDateTime) + "_" + username)
        postDb.setData([
            "title": title,
            "content": content,
            "username": username,
            "createdDate": formatterDate.string(from: currentDateTime),
            "totalComment": 0
        ])
    }
    
    func deletePost(gameID: String, postID: String) {
        db.collection("games").document(gameID).collection("posts").document(postID).delete() { err in
            if let err = err {
                print("Error removing document: \(err)")
            } else {
                print("Document successfully removed!")
            }
        }
    }
    
}
