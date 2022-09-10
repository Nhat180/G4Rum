//
//  HomeView.swift
//  G4Rum
//
//  Created by Thang, Ta Quoc on 06/09/2022.
//

import SwiftUI

struct HomeView: View {
    @StateObject private var gameViewModel = GameViewModel()
    @ObservedObject var authViewModel = AuthViewModel()
    
    var body: some View {
//        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        VStack {
            NavigationView {
                List(gameViewModel.randomGames) { game in
                    VStack(alignment: .leading) {
                        Text(game.id)
                            .font(.headline)
                        Text(game.name)
                            .font(.subheadline)
                    }
                }
                .navigationBarTitle("Game testing")
                .onAppear() {
                    self.gameViewModel.getRandomGames()
                }
            }
            Button(action: {
                print("Hello")
                authViewModel.signOut()
            }) {
                Text("LOG OUT")
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    .padding(.vertical)
                    .padding(.horizontal, 55)
                    .background(ColorConstants.darkRed)
                    .clipShape(Capsule())
                    // shadow...
                    .shadow(color: Color.white.opacity(0.1), radius: 5, x: 0, y: 5)
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
