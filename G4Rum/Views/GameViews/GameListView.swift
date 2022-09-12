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
    
    init() {
        coloredNavAppearance.configureWithOpaqueBackground()
        coloredNavAppearance.backgroundColor = UIColor(red: 0.50, green: 0.00, blue: 0.00, alpha: 1)
        coloredNavAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
                coloredNavAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        UINavigationBar.appearance().standardAppearance = coloredNavAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = coloredNavAppearance
        UITextField.appearance(whenContainedInInstancesOf: [UISearchBar.self]).backgroundColor = .white
        UITextField.appearance(whenContainedInInstancesOf: [UISearchBar.self]).tintColor = .black
    }
    
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
            List{
                ForEach(filteredGame, id: \.id) {
                    game in
                    ZStack {
                        NavigationLink(destination: GameCardView(game: game)) {
                                EmptyView()
                        }.buttonStyle(PlainButtonStyle())
                                GameRowView(game: game)
                    }
                }
                .listRowSeparator(.hidden)
                .padding(.top,5)
                .navigationBarTitle(Text("Game List 🎮"))
            }
            .listStyle(.plain)
        }
        .disableAutocorrection(true)
        .accentColor(.white)
        .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always))
        .onAppear() {
            self.gameViewModel.getAllGames(genre: "action")
        }
    }
}

struct GameListView_Previews: PreviewProvider {
    static var previews: some View {
        GameListView()
    }
}
