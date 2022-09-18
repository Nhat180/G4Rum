/*
  RMIT University Vietnam
  Course: COSC2659 iOS Development
  Semester: 2022B
  Assessment: Assignment 3
  Author: NoName Team
  Created  date: 13/9/2022
  Last modified: 18/9/2022
  Acknowledgement: Acknowledge the resources that you use here.
*/

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
