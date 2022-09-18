/*
  RMIT University Vietnam
  Course: COSC2659 iOS Development
  Semester: 2022B
  Assessment: Assignment 3
  Author: NoName Team
  Created  date: 9/9/2022
  Last modified: 18/9/2022
  Acknowledgement: Acknowledge the resources that you use here.
*/

import SwiftUI

struct GameRowView: View {
    @Environment(\.colorScheme) var colorScheme
    
    let width = UIScreen.main.bounds.width
    let height = UIScreen.main.bounds.height
    
    var game: Game
    
    var body: some View {
        VStack {
            HStack {
                AsyncImage(url: URL(string: game.imageUrl)) { image in
                            image
                                .resizable()
                                .frame(width: width / 4, height: width / 4)
                                .clipShape(RoundedRectangle(cornerRadius: 25))
                        } placeholder: {
                            Color.gray
                        }
                        .frame(width: width / 4, height: width / 4)
                        .clipShape(RoundedRectangle(cornerRadius: 25))
                Divider()
                    .overlay(colorScheme == .dark ? .white : .black)
                VStack {
                    Text(game.name)
                        .font(.system(size: width / 25))
                        .bold()
                        .frame(maxWidth: .infinity, alignment:.leading)
                    
                    Text(game.developer)
                        .font(.system(size: width / 30))
                        .bold().opacity(0.5)
                        .frame(maxWidth: .infinity, alignment:.leading)
                }
                Text(game.ratings + "/5")
                    .font(.system(size: width / 30))
                    .bold()
                    //.frame(maxWidth: .infinity, alignment:.trailing)
            }
            Divider()
                .frame(width: width / 10 * 9)
                .overlay(colorScheme == .dark ? .white : .black)

        }
        .padding([.leading, .trailing], width / 20)
    }
}

struct GameRowView_Previews: PreviewProvider {
    static var previews: some View {
        Text("Hello Game Row")
    }
}
