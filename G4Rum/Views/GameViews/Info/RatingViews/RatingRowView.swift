//
//  RatingRowView.swift
//  G4Rum
//
//  Created by Nhat, Nguyen Minh on 13/09/2022.
//

import SwiftUI

struct RatingRowView: View {
    var rating: Comment
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(rating.username)
                Spacer()
                Text(rating.createdDate)
            }
            StarsView(rating: CGFloat(rating.rating))
            Text(rating.text)
        }
        .padding()
        .background(Color.gray.opacity(0.1))
        .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

//struct RatingRowView_Previews: PreviewProvider {
//    static var previews: some View {
//        RatingRowView()
//    }
//}
