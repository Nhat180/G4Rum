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

var posts = [
    Post(id: "1", title: "GG Well Play", content: "Troi hom nay nhieu may cuc dat ban tay minh ngay nguc, mua thu mang giac mo quay ve an nguyen ven nhu hom nay la bay theo gio son sao, chon xua anh ho, doan duong ngay nao hai tta tung don dua con van vuong phai mo giau yeu6 thuong trong van tho chung1 ta la ang may ngang troi tvoii vang ngang 1ua chung ta ", username: "Juan Chavez", createdDate: "Apr 29",  totalComment: 1),
    Post(id: "2", title: "GG Well Play", content: "hg", username: "Jua", createdDate: "Apr 25", totalComment: 1),
    Post(id: "3", title: "GG Well Play", content: "hello hi", username: "Ju", createdDate: "A 29", totalComment: 1),
    Post(id: "4", title: "GG Well Play", content: "hello hi", username: "Tong", createdDate: "Apr 29", totalComment: 1),
    Post(id: "5", title: "GG Well Play", content: "hello hi", username: "Nguyen", createdDate: "Apr 29", totalComment: 1),
    Post(id: "6", title: "GG Well Play", content: "hello hi", username: "Nhi", createdDate: "Apr 29", totalComment: 1),
]
