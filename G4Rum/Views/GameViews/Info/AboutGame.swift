//
//  AboutGame.swift
//  G4Rum
//
//  Created by Maxx Trần on 11/09/2022.
//

import SwiftUI

struct AboutGame: View {
    @Environment(\.colorScheme) var colorScheme
    
    var game: Game
    let width = UIScreen.main.bounds.width
    let height = UIScreen.main.bounds.height
    @State private var isExpanded: Bool = false
    
    var body: some View {
        Text("About Game")
            .font(.system(size: width / 15))
            .bold()
            .offset(y: 10).padding(.leading, 5).padding(.bottom, 2)
            .frame(maxWidth: .infinity, alignment:.leading)
        Text(game.description)
            .font(.system(size: width / 25))
            .opacity(0.5)
            .offset(y: 10)
            .padding(.leading, 5)
            .frame(maxWidth: .infinity, alignment:.leading)
            .lineLimit(isExpanded ? nil : 3)
        Button(action: {
            isExpanded = !isExpanded
        }) {
            Text(isExpanded ? "Less" : "More")
                .font(.system(size: width / 25)).bold().foregroundColor(colorScheme == .dark ? Color.blue : ColorConstants.darkBlue)
                .offset(y: 15).padding(.leading, 5)
                .frame(maxWidth: .infinity, alignment:.leading)
        }
    }
}

struct AboutGame_Previews: PreviewProvider {
    static var previews: some View {
        AboutGame(game: Game(id: "fefe", name: "Elden Ring", developer: "developer", releaseDate: "Oct 14 2022", ratings: "5/5", minAge: "12+", size: "120GB", genre: "action", totalComment: 0, totalRating: 0, description: "Just a description", imageUrl: "fefefef"))
    }
}
