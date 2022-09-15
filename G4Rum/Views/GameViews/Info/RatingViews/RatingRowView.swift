//
//  RatingRowView.swift
//  G4Rum
//
//  Created by Nhat, Nguyen Minh on 13/09/2022.
//

import SwiftUI

struct RatingRowView: View {
    var rating: Comment
    let width = UIScreen.main.bounds.width
    let height = UIScreen.main.bounds.height
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(rating.username)
                    .font(.system(size: width / 25))
                Spacer()
                Text(rating.createdDate)
                    .font(.system(size: width / 25))
                    .frame(alignment: .topTrailing)
                    .opacity(0.5)
            }
            StarsView(rating: CGFloat(rating.rating))
            Text(rating.text)
                .font(.system(size: width / 25))
                .opacity(0.5)
        }
        .padding()
        .background(Color.gray.opacity(0.1))
        .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}
