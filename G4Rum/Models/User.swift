//
//  User.swift
//  G4Rum
//
//  Created by Maxx Trần on 06/09/2022.
//

import Foundation

struct User: Identifiable, Codable {
    var id: String
    var username: String
    var email: String
}
