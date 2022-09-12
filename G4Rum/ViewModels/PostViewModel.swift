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
        db.collection("games").document(gameID).collection("posts").addSnapshotListener {(querySnapshot, error) in
            guard let documents = querySnapshot?.documents else {
                print("No documents")
                return
            }
            
        }
    }
}
