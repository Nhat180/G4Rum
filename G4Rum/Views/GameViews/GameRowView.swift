//
//  GameRow.swift
//  G4Rum
//
//  Created by Maxx Trần on 09/09/2022.
//

import SwiftUI

struct GameRowView: View {
    var game: Game
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20, style: .continuous).fill(
                LinearGradient(gradient: Gradient(colors: [
                    ColorConstants.darkRed,
                    ColorConstants.blue
                ]),
                               startPoint: .topLeading,
                               endPoint: .bottomTrailing)
            )
            HStack {
                AsyncImage(url: URL(string: game.imageUrl)) { image in
                            image
                                .resizable()
                                .frame(width: 98, height: 98)
                                .clipShape(RoundedRectangle(cornerRadius: 60, style: .continuous))
                        } placeholder: {
                            Color.gray
                        }
                        .frame(width: 98, height: 98)
                        //.clipShape(RoundedRectangle(cornerRadius: 60, style: .continuous))
                
                VStack {
                    Text(game.name)
                        .font(.system(size: 16))
                        .foregroundColor(.white)
                        .bold().offset(x: -5).padding(.leading, 5)
                        .frame(maxWidth: .infinity, alignment:.leading)
                    
                    Text(game.developer)
                        .font(.system(size: 15))
                        .foregroundColor(.white)
                        .bold().offset(x: -4, y: 5).padding(.leading, 5).opacity(0.5)
                        .frame(maxWidth: .infinity, alignment:.leading)
                        .foregroundColor(.white)
                }
                Spacer()
                Text(game.ratings + "/5")
                    .font(.system(size: 16))
                    .foregroundColor(.white)
                    .bold().padding(.trailing, 10)
                //.frame(maxWidth: .infinity, alignment:.leading)
            }
        }
    }
}

struct GameRowView_Previews: PreviewProvider {
    static var previews: some View {
        Text("Hello Game Row")
    }
}
