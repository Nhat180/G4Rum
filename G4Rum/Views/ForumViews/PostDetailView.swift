//
//  DetailPostViews.swift
//  G4Rum
//
//  Created by Ngô Xuân Huy on 15/09/2022.
//

import SwiftUI

struct PostDetailView: View {
    @Environment(\.colorScheme) var colorScheme

    var post: Post
    @State var textEditorHeight : CGFloat = 100
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
                                }
                                Spacer()
                            }
                            
                            Text(post.content)
                            Divider()
                                .overlay(colorScheme == .dark ? .white : .black)
                            
                            Text("Discussion")
                                .font(.system(size: width / 20))
                            ForEach(comments) { comment in
                                CommentRowView(comment: comment)
                            }
                        }
                        .padding()
                    }
//                    HStack(alignment: .bottom) {
//                        VStack(alignment: .leading) {
//                            Text("Comment")
//                                .font(.system(size: width / 20))
//                            TextEditor(
//                                text: $comment)
//                            .frame(height: min(40,textEditorHeight))
//                            .textFieldStyle(.roundedBorder)
//                            .colorMultiply(.gray)
//                            .disableAutocorrection(true)
//                        }
//                        Button {
//                        } label: {
//                            Label("Send", systemImage: "plus")
//                        }
//                    }
                }
            }
        }
    }
