/*
  RMIT University Vietnam
  Course: COSC2659 iOS Development
  Semester: 2022B
  Assessment: Assignment 3
  Author: NoName Team
  Created  date: 13/9/2022
  Last modified: 18/9/2022
  Acknowledgement: Acknowledge the resources that you use here.
*/

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
    
    func getAllRatings(gameID: String) {
        db.collection("games").document(gameID).collection("reviews").addSnapshotListener {(querySnapshot, error) in
            guard let documents = querySnapshot?.documents else {
                print("No documents")
                return
            }
            
            self.reviews = documents.map {(queryDocumentSnapshot) -> Comment in
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
    
    func addComment(game: Game, username: String, text: String, rating: Int) {
        let currentDateTime = Date()
        let formatterID = DateFormatter()
        let formatterDate = DateFormatter()
        formatterID.dateFormat = "yyyy-MM-d HH:mm:ss"
        formatterDate.dateFormat = "d/MM/yyyy"
        
        updateGameInfo(game: game, rating: rating)
        let ratingDb = db.collection("games").document(game.id).collection("reviews")
            .document(formatterID.string(from: currentDateTime) + "_" + username)
        ratingDb.setData([
            "username": username,
            "text": text,
            "rating": rating,
            "createdDate": formatterDate.string(from: currentDateTime)
        ])
    }
    
    func updateGameInfo(game: Game, rating: Int) {
        let currentRating = convertStringToDouble(str: game.ratings)
        let newRating = (currentRating * Double(game.totalRating) + Double(rating)) / (Double(game.totalRating + 1))
        let ratingString: String = String(format: "%.1f", newRating)
        
        db.collection("games").document(game.id).updateData([
            "rating": ratingString,
            "totalRating": game.totalRating + 1,
            "totalComment": game.totalComment + 1
        ])
    }
    
    func convertStringToDouble(str: String) -> Double {
        let myDouble = Double(str) ?? 0
        return myDouble
    }
}
