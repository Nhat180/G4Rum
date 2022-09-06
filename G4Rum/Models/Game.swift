//
//  Game.swift
//  G4Rum
//
//  Created by Maxx Trần on 06/09/2022.
//

import Foundation

struct Game: Identifiable, Codable {
    var id: String
    var name: String
    var developer: String
    var releaseDate: String
    var ratings: String
    var minAge: String
    var language: String
    var size: String
    var genre: String
    var totalComment: Int
    var description: String
    
    var imageUrl: String
}
