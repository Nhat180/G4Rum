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
import FirebaseAuth

struct PostDetailView: View {
    @StateObject private var postComment = PostCommentViewModel()
    
    @Environment(\.colorScheme) var colorScheme
    var gameID: String
    var post: Post
    @State private var validation = false
    @State var alertStr = ""
    @State var textEditorHeight : CGFloat = 100
    let user = Auth.auth().currentUser
    let width = UIScreen.main.bounds.width
    let height = UIScreen.main.bounds.height
    
    @State var comment: String = ""
        var body: some View {
            ZStack {
                LinearGradient(gradient: Gradient(colors: colorScheme == .dark ? ColorConstants.colorDarkMode : ColorConstants.colorLightMode),
                startPoint: .topLeading,
                endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.all)
                VStack {
                    ScrollView {
                        VStack{
                            Text(post.title)
                                .font(.system(size: width / 15))
                                .bold()
                                .frame(maxWidth: .infinity, alignment:.leading)
                                .padding(.bottom, 2)
                            HStack{
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
                            
                            Text(post.content)
                                .font(.system(size: width / 25))
                                .opacity(0.5)
                                .frame(maxWidth: .infinity, alignment:.leading)
                            Divider()
                                .overlay(colorScheme == .dark ? .white : .black)
                            
                            Text("Discussion")
                                .font(.system(size: width / 20))
                                .frame(maxWidth: .infinity, alignment:.leading)
                            ForEach(postComment.comments) { comment in
                                CommentRowView(comment: comment)
                            }
                        }
                    }
                    HStack(alignment: .bottom) {
                        VStack(alignment: .leading) {
                            Text("Comment")
                                .font(.system(size: width / 20))
                            TextEditor(text: $comment)
                                .frame(height: width / 10)
                                .opacity(0.5)
                                .foregroundColor(colorScheme == .dark ? .white : .black)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                                .disableAutocorrection(true)
                        }
                        Button {
                            if (comment == "") {
                                alertStr = "Please put some comment before sending"
                                validation = true
                            } else {
                                postComment.addComment(gameID: gameID, post: post, username: (user?.email)!, text: comment)
                                comment = ""
                            }
                            
                        } label: {
                            Text("Send")
                                .font(.system(size: width / 25))
                                .frame(alignment: .center)
                        }
                    }
                }
                .padding()
                .navigationBarTitleDisplayMode(.inline)
                .toast(message: alertStr, isShowing: $validation, duration: Toast.short)
            }.onAppear() {
                self.postComment.getAllComment(gameID: gameID, postID: post.id)
            }
        }
    }
