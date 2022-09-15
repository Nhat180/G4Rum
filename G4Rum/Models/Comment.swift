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

var comments = [
    Comment(id: "1", username: "Juan Chavez", text: "Troi hom nay nhieu may cuc dat ban tay minh ngay nguc, mua thu mang giac mo quay ve an nguyen ven nhu hom nay la bay theo gio son sao, chon xua anh ho, doan duong ngay nao hai tta tung don dua con van vuong phai mo giau yeu6 thuong trong van tho chung1 ta la ang may ngang troi tvoii vang ngang 1ua chung ta ", createdDate: "Apr 29", rating: 0),
    Comment(id: "2", username: "Jua", text: "hg", createdDate: "Apr 25", rating: 0),
    Comment(id: "3", username: "Ju", text: "hello hi", createdDate: "A 29", rating: 0),
    Comment(id: "4", username: "Tong", text: "hello hi", createdDate: "Apr 29", rating: 0),
    Comment(id: "5", username: "Nguyen", text: "hello hi", createdDate: "Apr 29", rating: 0),
    Comment(id: "6", username: "Nhi", text: "hello hi", createdDate: "Apr 29", rating: 0),
]
