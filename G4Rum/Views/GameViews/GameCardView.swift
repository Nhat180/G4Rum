/*
  RMIT University Vietnam
  Course: COSC2659 iOS Development
  Semester: 2022B
  Assessment: Assignment 3
  Author: NoName Team
  Created  date: 10/9/2022
  Last modified: 18/9/2022
  Acknowledgement: Acknowledge the resources that you use here.
*/

import SwiftUI

struct GameCardView: View {
    @Environment(\.colorScheme) var colorScheme
    
    var game: Game
    let width = UIScreen.main.bounds.width
    let height = UIScreen.main.bounds.height
    @State private var showAllRatingView = false
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: colorScheme == .dark ? ColorConstants.colorDarkMode : ColorConstants.colorLightMode),
            startPoint: .topLeading,
            endPoint: .bottomTrailing)
            .edgesIgnoringSafeArea(.all)
            ScrollView {
                VStack {
                    GameInfo(game: game)
                    Divider().overlay(colorScheme == .dark ? .white : .black).padding(.top, 15)
                    AboutGame(game: game)
                    Divider().overlay(colorScheme == .dark ? .white : .black).padding(.top, 15)
                    HStack(alignment: .top) {
                        Text("Ratings & Reviews")
                            .font(.system(size: width / 15))
                            .bold()
                            .offset(y: 10).padding(.leading, 5).padding(.bottom, 2)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        Spacer()
                        NavigationLink("",destination: AllRatingView(game: game), isActive: $showAllRatingView)
                        Button(action: {
                            showAllRatingView.toggle()
                        }) {
                            Text("See All")
                                .font(.system(size: width / 25)).bold().foregroundColor(colorScheme == .dark ? Color.blue : ColorConstants.darkBlue)
                                .offset(y: 18)
                        }
                    }.padding(.bottom, 10)
                    PreviewRatingView(game: game)
                }
                .padding()
            }
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct GameCardView_Previews: PreviewProvider {
    static var previews: some View {
        GameCardView(game: Game(id: "fefe", name: "Elden Ring", developer: "developer", releaseDate: "Oct 14 2022", ratings: "5/5", minAge: "12+", size: "120GB", genre: "action", totalComment: 0, totalRating: 0, description: "Just a description", imageUrl: "fefefef"))
    }
}
