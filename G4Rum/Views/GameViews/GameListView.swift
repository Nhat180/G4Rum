//
//  GameList.swift
//  G4Rum
//
//  Created by Maxx Trần on 09/09/2022.
//

import SwiftUI

let coloredNavAppearance = UINavigationBarAppearance()

struct GameListView: View {
    @StateObject private var gameViewModel = GameViewModel()
    @State var searchText = ""
    
    var filteredGame: [Game] {
        if (searchText.isEmpty) {
            return gameViewModel.games
        } else {
            return gameViewModel.games.filter {
                $0.name.lowercased().contains(searchText.lowercased())
            }
        }
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [
                    .black,
                    ColorConstants.darkRed
                ]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.all)
                ScrollView (.vertical, showsIndicators: false) {
                    if (filteredGame.isEmpty) {
                        Text("No games found")
                    } else {
                        VStack {
                            ForEach(filteredGame, id: \.id) {
                                game in NavigationLink(
                                    destination: GameCardView(game: game), label: {
                                        GameRowView(game: game)
                                    })
                            }
                            .listRowSeparator(.hidden)
                            .navigationBarTitle(Text("Game List"))
                            .background(.clear)
                        }
                    }
                }
            }
            
        }
        .disableAutocorrection(true)
        .accentColor(.white)
        .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always))
        .onAppear() {
            self.gameViewModel.getAllGames(genre: "Action")
        }
    }
}

struct GameListView_Previews: PreviewProvider {
    static var previews: some View {
        GameListView()
    }
}
