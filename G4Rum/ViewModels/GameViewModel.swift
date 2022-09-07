//
//  GameViewModel.swift
//  G4Rum
//
//  Created by Maxx Trần on 06/09/2022.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

class GameViewModel: ObservableObject {
    @Published var games = [Game]()
    
    private var db = Firestore.firestore()
    
    func getAllGames(genre: String) {
        db.collection("games").whereField("genre", isEqualTo: genre).addSnapshotListener { (querySnapshot, error) in
            guard let documents = querySnapshot?.documents else {
                print ("No documents")
                return
            }
            
            self.games = documents.map { (queryDocumentSnapshot) -> Game in
                let data = queryDocumentSnapshot.data()
                let id = queryDocumentSnapshot.documentID
                let name = data["name"] as? String ?? ""
                let developer = data["developer"] as? String ?? ""
                let releaseDate = data["releaseDate"] as? String ?? ""
                let ratings = data["ratings"] as? String ?? ""
                let minAge = data["minAge"] as? String ?? ""
                let size = data["size"] as? String ?? ""
                let genre = data["genre"] as? String ?? ""
                let totalComment = data["totalComment"] as? Int ?? 0
                let totalRating = data["totalRating"] as? Int ?? 0
                let description = data["description"] as? String ?? ""
                let imageUrl = data["imageUrl"] as? String ?? ""
                return Game(id: id, name: name, developer: developer, releaseDate: releaseDate, ratings: ratings, minAge: minAge, size: size, genre: genre, totalComment: totalComment, totalRating: totalRating, description: description, imageUrl: imageUrl)
            }
        }
    }
}
