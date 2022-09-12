//
//  GameInfo.swift
//  G4Rum
//
//  Created by Maxx Trần on 10/09/2022.
//

import SwiftUI

struct GameInfo: View {
    var game: Game
    @State private var showPostListView = false
    var body: some View {
        HStack {
            AsyncImage(url: URL(string: game.imageUrl)) { image in
                        image
                            .resizable()
                            .frame(width: 200, height: 200)
                            .clipShape(Rectangle())
                            .padding(.leading, 5)
                            .padding(.top, 10)
                    } placeholder: {
                        Color.gray
                    }
                    .frame(width: 200, height: 200)
                    .clipShape(Rectangle())
                    .padding(.leading, 5)
                    .padding(.top, 10)
            VStack {
                Spacer()
                Text(game.name)
                    .font(.system(size: 25))
                    .bold().foregroundColor(.white)
                    .frame(maxWidth: .infinity, alignment:.leading)
                    .padding(.leading, 5)
                    .padding(.trailing, 8)
                Spacer()
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
                
                NavigationLink("",destination: PostListView(), isActive: $showPostListView)
                Button(action: {
                    showPostListView.toggle()
                   }, label: {
                       Capsule()
                           .fill(Color.blue)
                           .padding(10)
                           .frame(width: 120, height: 60)
                           .overlay(Text("FORUMS")
                           .font(.system(size: 16))
                           .fontWeight(.bold)
                           .foregroundColor(.white))
                   }).offset(x: -5).frame(maxWidth: .infinity, alignment:.leading)
            }
        }
        Divider().overlay(.white).padding(.top, 10).padding(.bottom, 15)
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                VStack {
                    Text("RATINGS")
                        .foregroundColor(.white)
                        .font(.system(size: 18)).padding(.leading, 20)
                    Text(game.ratings + "/5")
                        .foregroundColor(.white)
                        .font(.system(size: 28)).padding(.leading, 20)
                }
                Divider().frame(height: 50)
                    .overlay(.white).padding(.leading, 20)
                VStack(alignment: .center) {
                    Text("AGE")
                        .foregroundColor(.white)
                        .font(.system(size: 18)).padding(.leading, 20)
                    Text(game.minAge)
                        .foregroundColor(.white)
                        .font(.system(size: 28)).padding(.leading, 20)
                }
                Divider().frame(height: 50)
                    .overlay(.white).padding(.leading, 20)
                VStack(alignment: .center) {
                    Text("SIZE")
                        .foregroundColor(.white)
                        .font(.system(size: 18)).padding(.leading, 20)
                    Text(game.size)
                        .foregroundColor(.white)
                        .font(.system(size: 28)).padding(.leading, 20)
                }
                Divider().frame(height: 50)
                    .overlay(.white).padding(.leading, 20)
                VStack(alignment: .center) {
                    Text("GENRE")
                        .foregroundColor(.white)
                        .font(.system(size: 18)).padding(.leading, 20)
                    Text(game.genre)
                        .foregroundColor(.white)
                        .font(.system(size: 28)).padding(.leading, 20)
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
