//
//  PostCardRowView.swift
//  G4Rum
//
//  Created by Ngô Xuân Huy on 15/09/2022.
//

import SwiftUI

struct PostCardRowView: View {
    var post: Post
    let width = UIScreen.main.bounds.width
    let height = UIScreen.main.bounds.height
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Image("headphone")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: width / 10, height: width / 10)
                    .clipShape(Rectangle())
                
                VStack(alignment: .leading) {
                    Text(post.username)
                        .font(.system(size: width / 25))
                    Text(post.createdDate)
                        .font(.system(size: width / 30))
                        .opacity(0.5)
                }
                Spacer()
            }
            Text(post.title)
                .lineLimit(2)
                .font(.system(size: width / 20))
            Spacer()
                
            Text(post.content)
                .lineLimit(4)
                .font(.system(size: width / 25))
                .opacity(0.5)
        }
        .padding()
        .background(Color.gray.opacity(0.1))
        .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}
