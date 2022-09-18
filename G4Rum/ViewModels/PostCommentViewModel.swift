/*
  RMIT University Vietnam
  Course: COSC2659 iOS Development
  Semester: 2022B
  Assessment: Assignment 3
  Author: NoName Team
  Created  date: 15/9/2022
  Last modified: 18/9/2022
  Acknowledgement: Acknowledge the resources that you use here.
*/

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

class PostCommentViewModel: ObservableObject {
    @Published var comments = [Comment]()
    
    private var db = Firestore.firestore()
    
    func getAllComment(gameID: String, postID: String) {
        db.collection("games").document(gameID).collection("posts").document(postID).collection("comments").addSnapshotListener {(querySnapshot, error) in
            guard let documents = querySnapshot?.documents else {
                print("No documents")
                return
            }
            
            self.comments = documents.map { (queryDocumentSnapshot) -> Comment in
                let data = queryDocumentSnapshot.data()
                let id = queryDocumentSnapshot.documentID
                let username = data["username"] as? String ?? ""
                let text = data["text"] as? String ?? ""
                let createdDate = data["createdDate"] as? String ?? ""
                let rating = data["rating"] as? Int ?? 0
                return Comment(id: id, username: username, text: text, createdDate: createdDate, rating: rating)
            }
        }
    }
    
    func addComment(gameID: String, post: Post, username: String, text: String) {
        let currentDateTime = Date()
        let formatterID = DateFormatter()
        let formatterDate = DateFormatter()
        formatterID.dateFormat = "yyyy-MM-d HH:mm:ss"
        formatterDate.dateFormat = "d/MM/yyyy"
        
        updatePostInfo(gameID: gameID, post: post)
        let commentDb = db.collection("games").document(gameID).collection("posts").document(post.id)
            .collection("comments").document(formatterID.string(from: currentDateTime) + "_" + username)
        commentDb.setData([
            "username": username,
            "text": text,
            "rating": 0,
            "createdDate": formatterDate.string(from: currentDateTime)
        ])
    }
    
    func updatePostInfo(gameID: String, post: Post) {
        db.collection("games").document(gameID).collection("posts").document(post.id).updateData([
            "totalComment": post.totalComment + 1
        ])
    }
}
