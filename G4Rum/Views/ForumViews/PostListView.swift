/*
  RMIT University Vietnam
  Course: COSC2659 iOS Development
  Semester: 2022B
  Assessment: Assignment 3
  Author: NoName Team
  Created  date: 15/9/2022
  Last modified: 18/9/2022
  Acknowledgement: Acknowledge the resources that you use here.
*/
import SwiftUI

struct PostListView: View {
    @StateObject private var postViewModel = PostViewModel()
    
    @Environment(\.colorScheme) var colorScheme
    var gameID: String
    let width = UIScreen.main.bounds.width
    let height = UIScreen.main.bounds.height
    
    @State var addPost:Bool = false
    var body: some View {
//        if addPost {
//            AddPostViews(gameID: gameID)
//        } else {
            ZStack {
                LinearGradient(gradient: Gradient(colors: colorScheme == .dark ? ColorConstants.colorDarkMode : ColorConstants.colorLightMode),
                startPoint: .topLeading,
                endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.all)
                ZStack {
                    ScrollView {
                        VStack {
                            ForEach(postViewModel.posts) { post in
                                NavigationLink {
                                    PostDetailView(gameID: gameID, post: post)
                                } label: {
                                    PostCardRowView(post: post)
                                }
                            }
                        }
                        .padding()
                    }
                    NavigationLink("",destination: AddPostViews(gameID: gameID), isActive: $addPost)
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
            .navigationBarTitle("All Posts")
            .onAppear() {
                self.postViewModel.getAllPosts(gameID: gameID)
            }
        //}
    }
}

struct PostListView_Previews: PreviewProvider {
    static var previews: some View {
        PostListView(gameID: "fhweufwfeiuwf342342")
    }
}
