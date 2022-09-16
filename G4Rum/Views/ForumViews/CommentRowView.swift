//
//  CommentRowView.swift
//  G4Rum
//
//  Created by Ngô Xuân Huy on 15/09/2022.
//

import SwiftUI

struct CommentRowView: View {
    var comment: Comment
    let width = UIScreen.main.bounds.width
    let height = UIScreen.main.bounds.height
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Image("chat")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: width / 10, height: width / 10)
                    .clipShape(Rectangle())
                Text(comment.username)
                    .font(.system(size: width / 25))
                Spacer()
            }
            Text(comment.text)
                .font(.system(size: width / 30))
                .opacity(0.5)
            Spacer()
        }
        .padding()
        .background(Color.gray.opacity(0.2))
        .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}
