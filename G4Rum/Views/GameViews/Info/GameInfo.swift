/*
  RMIT University Vietnam
  Course: COSC2659 iOS Development
  Semester: 2022B
  Assessment: Assignment 3
  Author: NoName Team
  Created  date: 10/9/2022
  Last modified: 18/9/2022
  Acknowledgement: Acknowledge the resources that you use here.
*/

import SwiftUI

struct GameInfo: View {
    @Environment(\.colorScheme) var colorScheme
    var game: Game
    let width = UIScreen.main.bounds.width
    let height = UIScreen.main.bounds.height
    @State private var showPostListView = false
    
    var body: some View {
        HStack {
            AsyncImage(url: URL(string: game.imageUrl)) { image in
                        image
                            .resizable()
                            .frame(width: width / 3, height: width / 3)
                            .clipShape(RoundedRectangle(cornerRadius: 25))
                            .padding()
                    } placeholder: {
                        Color.gray
                    }
                    .frame(width: width / 3, height: width / 3)
                    .clipShape(RoundedRectangle(cornerRadius: 25))
                    .padding(.trailing, 10)
            VStack {
                Spacer()
                Text(game.name)
                    .font(.system(size: width / 20))
                    .bold()
                    .frame(maxWidth: .infinity, alignment:.leading)
                    .padding(.trailing, 10)
                Spacer()
                Text(game.developer)
                    .font(.system(size: width / 30))
                    .bold()
                    .opacity(0.5)
                    .padding(.trailing, 10)
                    .frame(maxWidth: .infinity, alignment:.leading)
        
                Text("Released: " + game.releaseDate)
                    .font(.system(size: width / 30))
                    .bold()
                    .opacity(0.5)
                    .padding(.trailing, 10)
                    .frame(maxWidth: .infinity, alignment:.leading)
                
                NavigationLink("",destination: PostListView(gameID: game.id), isActive: $showPostListView)
                Button(action: {
                    showPostListView.toggle()
                   }, label: {
                       Capsule()
                           .fill(.gray.opacity(0.4))
                           .frame(width: width / 2, height: height / 20)
                           .overlay(Text("FORUMS")
                           .font(.system(size: width / 25))
                           .fontWeight(.bold))
                   }).frame(maxWidth: .infinity, alignment:.leading)
            }
        }
        Divider().overlay(colorScheme == .dark ? .white : .black).padding(.top, 10).padding(.bottom, 15)
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                VStack {
                    Text("RATINGS")
                        .font(.system(size: width / 30)).padding(.leading, 20)
                        .opacity(0.5)
                    Text(game.ratings + "/5")
                        .font(.system(size: width / 20)).padding(.leading, 20).padding(.top, 1)
                        .opacity(0.5)
                }
                Divider()
                    .overlay(colorScheme == .dark ? .white : .black).padding(.leading, 20)
                VStack(alignment: .center) {
                    Text("AGE")
                        .font(.system(size: width / 30)).padding(.leading, 20)
                        .opacity(0.5)
                    Text(game.minAge)
                        .font(.system(size: width / 20)).padding(.leading, 20).padding(.top, 1)
                        .opacity(0.5)
                }
                Divider()
                    .overlay(colorScheme == .dark ? .white : .black).padding(.leading, 20)
                VStack(alignment: .center) {
                    Text("SIZE")
                        .font(.system(size: width / 30)).padding(.leading, 20)
                        .opacity(0.5)
                    Text(game.size)
                        .font(.system(size: width / 20)).padding(.leading, 20).padding(.top, 1)
                        .opacity(0.5)
                }
                Divider()
                    .overlay(colorScheme == .dark ? .white : .black).padding(.leading, 20)
                VStack(alignment: .center) {
                    Text("GENRE")
                        .font(.system(size: width / 30)).padding(.leading, 20).padding(.trailing, 20)
                        .opacity(0.5)
                    Text(game.genre)
                        .font(.system(size: width / 20)).padding(.leading, 20).padding(.trailing, 20).padding(.top, 1)
                        .opacity(0.5)
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
