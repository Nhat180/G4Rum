//
//  CategoryViewModel.swift
//  G4Rum
//
//  Created by Nhat, Nguyen Minh on 15/09/2022.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

class CategoryViewModel: ObservableObject {
    @Published var categories = [Category]()
    
    private var db = Firestore.firestore()
    
    func getAllCategories() {
        db.collection("categories").addSnapshotListener {(querySnapshot, error) in
            guard let documents = querySnapshot?.documents else {
                print("No documents")
                return
            }
            self.categories = documents.map {
                (queryDocumentSnapshot) -> Category in
                let data = queryDocumentSnapshot.data()
                let id = queryDocumentSnapshot.documentID
                let title = data["title"] as? String ?? ""
                let imageName = data["imageName"] as? String ?? ""
                return Category(id: id, title: title, imageName: imageName)
            }
        }
    }
}
