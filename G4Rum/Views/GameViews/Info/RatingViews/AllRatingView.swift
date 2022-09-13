//
//  AllRatingView.swift
//  G4Rum
//
//  Created by Nhat, Nguyen Minh on 13/09/2022.
//

import SwiftUI

struct AllRatingView: View {
    var game: Game
    @StateObject private var gameRatingViewModel = GameRatingViewModel()
    @State private var showingAddScreen = false
    var body: some View {
        NavigationView {
            ZStack {
                Color.white.edgesIgnoringSafeArea(.all)
                ScrollView {
                    ForEach(gameRatingViewModel.reviews) { rating in
                        RatingRowView(rating: rating)
                    }
                    .listRowSeparator(.hidden)
                    .padding()
                    .navigationTitle("All Reviews")
                    .toolbar {
                        ToolbarItem(placement: .navigationBarTrailing) {
                            Button {
                                showingAddScreen.toggle()
                            } label: {
                                Label("Add Review", systemImage: "plus").foregroundColor(Color.blue)
                            }
                        }
                    }
                    .sheet(isPresented: $showingAddScreen) {
                        AddRatingView(game: game)
                    }
                }
            }
        }.onAppear() {
            self.gameRatingViewModel.getAllRatings(gameID: game.id)
        }
    }
}

//struct AllRatingView_Previews: PreviewProvider {
//    static var previews: some View {
//        AllRatingView(gameID: "013Uyag0wVOlgqNwiFUo")
//    }
//}
