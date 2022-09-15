//
//  AllRatingView.swift
//  G4Rum
//
//  Created by Nhat, Nguyen Minh on 13/09/2022.
//

import SwiftUI

struct AllRatingView: View {
    @Environment(\.colorScheme) var colorScheme
    
    var game: Game
    @StateObject private var gameRatingViewModel = GameRatingViewModel()
    @State private var showingAddScreen = false
    let width = UIScreen.main.bounds.width
    let height = UIScreen.main.bounds.height
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: colorScheme == .dark ? ColorConstants.colorDarkMode : ColorConstants.colorLightMode),
            startPoint: .topLeading,
            endPoint: .bottomTrailing)
            .edgesIgnoringSafeArea(.all)
            ZStack {
                ScrollView {
                    VStack {
                        Text("All Ratings & Reviews")
                            .font(.system(size: width / 15))
                            .bold()
                            .frame(maxWidth: .infinity, alignment:.leading)
                            .padding(.bottom, 2)
                        ForEach(gameRatingViewModel.reviews) { rating in
                            RatingRowView(rating: rating)
                        }
                        .listRowSeparator(.hidden)
                    }
                    .padding()
                }
                Button {
                    showingAddScreen.toggle()
                } label: {
                    Image(systemName: "plus.circle.fill")
                        .resizable()
                        .frame(width: width / 8, height: width / 8)
                        .frame(alignment: .bottomTrailing)
                        .foregroundColor(.black)
                        .padding()
                }
                .offset(x: width * 3 / 8, y: height * 3 / 8)
                .sheet(isPresented: $showingAddScreen) {
                    AddRatingView(game: game)
                }
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .onAppear() {
            self.gameRatingViewModel.getAllRatings(gameID: game.id)
        }
    }
}
