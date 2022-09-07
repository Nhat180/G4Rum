//
//  Category.swift
//  G4Rum
//
//  Created by Maxx Trần on 07/09/2022.
//

import Foundation
import SwiftUI

struct Category: Identifiable, Codable {
    var id: String
    var title: String
    
    var imageName: String
    var image: Image {
        Image(imageName)
    }
}
