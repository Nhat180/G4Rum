//
//  GameRatingViewModel.swift
//  G4Rum
//
//  Created by Maxx Trần on 13/09/2022.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

class GameRatingViewModel: ObservableObject {
    @Published var reviews = [Comment]()
    
    private var db = Firestore.firestore()
    
    func getPreviewRating(gameID: String) {
        db.collection("games").document(gameID).collection("reviews").limit(to: 2).addSnapshotListener {(querySnapshot, error) in
            guard let documents = querySnapshot?.documents else {
                print("No documents")
                return
            }
            
            self.reviews = documents.map { (queryDocumentSnapshot) -> Comment in
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
}
