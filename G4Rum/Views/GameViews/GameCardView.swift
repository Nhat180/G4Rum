//
//  GameCard.swift
//  G4Rum
//
//  Created by Maxx Trần on 10/09/2022.
//

import SwiftUI

struct GameCardView: View {
    var game: Game
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
                }
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
