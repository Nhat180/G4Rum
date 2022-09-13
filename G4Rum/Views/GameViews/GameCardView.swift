//
//  GameCard.swift
//  G4Rum
//
//  Created by Maxx Trần on 10/09/2022.
//

import SwiftUI

struct GameCardView: View {
    var game: Game
    let width = UIScreen.main.bounds.width
    let height = UIScreen.main.bounds.height
    @State private var showAllRatingView = false
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [
                .black,
                ColorConstants.darkRed,
            ]),
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing)
            ScrollView {
                VStack {
                    GameInfo(game: game)
                    Divider().overlay(.white).padding(.top, 15)
                    AboutGame(game: game)
                    Divider().overlay(.white).padding(.top, 15)
                    HStack(alignment: .top) {
                        Text("Ratings & Reviews")
                            .font(.system(size: width / 15))
                            .bold().foregroundColor(.white)
                            .offset(y: 10).padding(.leading, 5).padding(.bottom, 2)
                            .frame(maxWidth: .infinity, alignment:.leading)
                        Spacer()
                        NavigationLink("",destination: AllRatingView(game: game), isActive: $showAllRatingView)
                        Button(action: {
                            showAllRatingView.toggle()
                        }) {
                            Text("See All")
                                .font(.system(size: width / 25)).bold().foregroundColor(Color.blue)
                                .offset(y: 18)
                        }
                    }.padding(.bottom, 10)
                    PreviewRatingView(game: game)
                }
                .padding()
            }
        }
        .edgesIgnoringSafeArea(.bottom)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct GameCardView_Previews: PreviewProvider {
    static var previews: some View {
        GameCardView(game: Game(id: "fefe", name: "Elden Ring", developer: "developer", releaseDate: "Oct 14 2022", ratings: "5/5", minAge: "12+", size: "120GB", genre: "action", totalComment: 0, totalRating: 0, description: "Just a description", imageUrl: "fefefef"))
    }
}
