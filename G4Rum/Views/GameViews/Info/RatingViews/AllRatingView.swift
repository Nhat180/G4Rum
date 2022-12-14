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
                        ForEach(gameRatingViewModel.reviews) { rating in
                            RatingRowView(rating: rating)
                        }
                        .listRowSeparator(.hidden)
                    }
                    .padding()
                }
                NavigationLink("",destination: AddRatingView(game: game), isActive: $showingAddScreen)
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
//                .sheet(isPresented: $showingAddScreen) {
//                    AddRatingView(game: game)
//                }
            }
        }
        .navigationBarTitle("All Ratings & Reviews")
        .onAppear() {
            self.gameRatingViewModel.getAllRatings(gameID: game.id)
        }
    }
}
