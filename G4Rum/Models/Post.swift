//
//  Post.swift
//  G4Rum
//
//  Created by Maxx Trần on 06/09/2022.
//

import Foundation

struct Post: Identifiable, Codable {
    var id: String
    var title: String
    var content: String
    var username: String
    var createdDate: String
    var totalComment: Int
}
