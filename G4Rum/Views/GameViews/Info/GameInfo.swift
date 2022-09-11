//
//  GameInfo.swift
//  G4Rum
//
//  Created by Maxx Trần on 10/09/2022.
//

import SwiftUI

struct GameInfo: View {
    var game: Game
    var body: some View {
        HStack {
            AsyncImage(url: URL(string: game.imageUrl)) { image in
                        image
                            .resizable()
                            .frame(width: 150, height: 150)
                            .clipShape(Rectangle())
                    } placeholder: {
                        Color.gray
                    }
                    .frame(width: 150, height: 150)
                    .clipShape(Rectangle())
            VStack {
                Text(game.name)
                    .font(.system(size: 30))
                    .bold().foregroundColor(.white).offset(x: 10)
                    .frame(maxWidth: .infinity, alignment:.leading)
                    .padding(2)
                Text(game.developer)
                    .font(.system(size: 16))
                    .bold().foregroundColor(.white)
                    .offset(x: 10, y: 10)
                    .frame(maxWidth: .infinity, alignment:.leading)
        
                Text("Released: " + game.releaseDate)
                    .font(.system(size: 16))
                    .bold().foregroundColor(.white)
                    .offset(x: 10, y: 10)
                    .frame(maxWidth: .infinity, alignment:.leading)
            }
        }
        Divider().overlay(.white).padding(.top, 10).padding(.bottom, 15)
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
//                VStack {
//                    Text("RATINGS")
//                        .font(.system(size: 18))
//                        .bold().foregroundColor(.white)
//                        //.offset(x: -75, y: 1)
//                    Text(game.ratings + "/5")
//                        .font(.system(size: 28))
//                        .bold().foregroundColor(.white)
//                        //.offset(x: -75, y: 1).padding(.trailing, 5)
//                }
//                Divider().frame(height: 100)
//                        .overlay(.white).offset(x: -20)
//                VStack {
//                    Text("AGE")
//                        .font(.system(size: 18))
//                        .bold().foregroundColor(.white)
//                        //.offset(x: 65).padding(.trailing, 5)
//                    Text(game.minAge)
//                        .font(.system(size: 28))
//                        .bold().foregroundColor(.white)
//                        //.offset(x: 65).padding(.leading, 5)
//                }
                VStack {
                    Text("RATINGS")
                        .foregroundColor(.white)
                        .font(.system(size: 18)).padding(.leading, 20)
                    Text("4.5/5")
                        .foregroundColor(.white)
                        .font(.system(size: 28)).padding(.leading, 20)
                }
                Divider().frame(height: 50)
                    .overlay(.white).padding(.leading, 20)
                VStack(alignment: .center) {
                    Text("AGE")
                        .foregroundColor(.white)
                        .font(.system(size: 18))
                    Text("18+")
                        .foregroundColor(.white)
                        .font(.system(size: 28))
                }
            }
        }
    }
}

struct GameInfo_Previews: PreviewProvider {
    static var previews: some View {
        GameInfo(game: Game(id: "fefe", name: "Elden Ring", developer: "developer", releaseDate: "Oct 14 2022", ratings: "5/5", minAge: "12+", size: "120GB", genre: "action", totalComment: 0, totalRating: 0, description: "Just a description", imageUrl: "fefefef"))
    }
}
