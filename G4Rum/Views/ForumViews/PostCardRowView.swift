//
//  PostCardRowView.swift
//  G4Rum
//
//  Created by Ngô Xuân Huy on 15/09/2022.
//

import SwiftUI

struct PostCardRowView: View {
    var post: Post
    var body: some View {
        VStack {
 
            HStack {
                VStack(alignment: .leading) {
                    
                    HStack {
                        Image("headphone")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 50, height: 50)
                            .clipShape(Rectangle())
                        
                        VStack(alignment: .leading) {
                            Text(post.createdDate)
                                .font(.headline)
                            Text(post.createdDate)
                                .font(.subheadline)
                        }
                        Spacer()
                    }
                    
                    Text(post.title)
                        .font(.title3)
                        .fontWeight(.black)
                        .foregroundColor(.primary)
                        .lineLimit(2)
                    Text(post.content)
                        .fixedSize(horizontal: false, vertical: true)
                        .lineLimit(4)
                        .font(.body)
                        .foregroundColor(.secondary)
                }
                .layoutPriority(100)
 
                Spacer()
            }
            .padding()
        }
        .cornerRadius(10)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color(.sRGB, red: 150/255, green: 150/255, blue: 150/255, opacity: 0.5), lineWidth: 2)
        )
        .padding(.top, 5)
    }
}
