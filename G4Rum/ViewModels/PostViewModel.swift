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
    
    func get
}
