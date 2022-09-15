//
//  ForumViews.swift
//  G4Rum
//
//  Created by Ngô Xuân Huy on 15/09/2022.
//

import SwiftUI

struct PostListView: View {
    @Environment(\.colorScheme) var colorScheme
    
    let width = UIScreen.main.bounds.width
    let height = UIScreen.main.bounds.height
    
    @State var addPost:Bool = false
    var body: some View {
        if addPost {
            AddPostViews()
        } else {
            ZStack {
                LinearGradient(gradient: Gradient(colors: colorScheme == .dark ? ColorConstants.colorDarkMode : ColorConstants.colorLightMode),
                startPoint: .topLeading,
                endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.all)
                ZStack {
                    ScrollView {
                        Text("All Posts")
                            .font(.system(size: width / 15))
                            .bold()
                            .frame(maxWidth: .infinity, alignment:.leading)
                            .padding(.bottom, 2)
                        ForEach(posts) { post in
                            NavigationLink {
                                PostDetailView(post: post)
                            } label: {
                                PostCardRowView(post: post)
                            }
                        }
                    }
                    .padding()
                    Button {
                        addPost.toggle()
                    } label: {
                        Image(systemName: "plus.circle.fill")
                            .resizable()
                            .frame(width: width / 8, height: width / 8)
                            .frame(alignment: .bottomTrailing)
                            .foregroundColor(.black)
                            .padding()
                    }
                    .offset(x: width * 3 / 8, y: height * 3 / 8)
                }
            }
        }
    }
}

struct PostListView_Previews: PreviewProvider {
    static var previews: some View {
        PostListView()
    }
}
