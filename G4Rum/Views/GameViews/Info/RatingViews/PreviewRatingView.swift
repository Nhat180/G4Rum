//
//  PreviewRatingView.swift
//  G4Rum
//
//  Created by Nhat, Nguyen Minh on 13/09/2022.
//

import SwiftUI

struct PreviewRatingView: View {
    var game: Game
    @StateObject private var gameRatingViewModel = GameRatingViewModel()
    
    var body: some View {
        ZStack {
            //Color.white.edgesIgnoringSafeArea(.all)
            ScrollView {
                ForEach(gameRatingViewModel.reviews) { rating in
                    RatingRowView(rating: rating)
                }
                .listRowSeparator(.hidden)
            }
        }.onAppear() {
            self.gameRatingViewModel.getPreviewRating(gameID: game.id)
        }
    }
}

//struct PreviewRatingView_Previews: PreviewProvider {
//    static var previews: some View {
//        PreviewRatingView()
//    }
//}
