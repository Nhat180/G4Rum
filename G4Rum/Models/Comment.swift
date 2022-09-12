//
//  Comment.swift
//  G4Rum
//
//  Created by Maxx Trần on 06/09/2022.
//

import Foundation

struct Comment: Identifiable, Codable {
    var id: String
    var username: String
    var text: String
    var createdDate: String
    var rating: Int
}
