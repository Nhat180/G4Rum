//
//  CommentRowView.swift
//  G4Rum
//
//  Created by Ngô Xuân Huy on 15/09/2022.
//

import SwiftUI

struct CommentRowView: View {
    var comment: Comment
    var body: some View {
        HStack(alignment: .top) {
            Image("chat")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 50, height: 50)
                .clipShape(Rectangle())
            
            VStack(alignment: .leading) {
                Text(comment.username)
                    .font(.headline)
                Text(comment.username)
                    .font(.subheadline)
            }
            Spacer()
        }
        .padding()
        .background(Color.gray)
    }
}
