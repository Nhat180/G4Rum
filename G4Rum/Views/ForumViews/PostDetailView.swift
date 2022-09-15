//
//  DetailPostViews.swift
//  G4Rum
//
//  Created by Ngô Xuân Huy on 15/09/2022.
//

import SwiftUI

struct PostDetailView: View {

    var post: Post
    @State var textEditorHeight : CGFloat = 100
    @State var comment: String = ""
        var body: some View {
            ZStack {
                Color.white
                .edgesIgnoringSafeArea(.bottom)
                VStack {
                    ScrollView {
                        VStack(alignment: .leading) {
                            Text(post.title)
                                .font(.title)
                            
                            HStack{
                                Image("headphone")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 50, height: 50)
                                    .clipShape(Rectangle())
                                
                                VStack(alignment: .leading) {
                                    Text(post.username)
                                        .font(.headline)
                                    .foregroundColor(.secondary)
                                    Text(post.createdDate)
                                        .font(.subheadline)
                                        .foregroundColor(.secondary)
                                }
                                Spacer()
                            }
                            
                            Text(post.content)
                            Divider()
                            Text("Discussion")
                            Divider()
                            
                            
                                ForEach(comments) { comment in
                                    CommentRowView(comment: comment)
                                }
                            
                        }
                        .padding()
                    }
                    HStack(alignment: .bottom) {
                        
                        VStack(alignment: .leading) {
                            Text("Comment")
                            TextEditor(
                                text: $comment)
                            .frame(height: min(40,textEditorHeight))
                            .textFieldStyle(.roundedBorder)
                            .colorMultiply(.gray)
                            .disableAutocorrection(true)
                        
                        }
                        
                        Button {
                            
                        } label: {
                            Label("Send", systemImage: "plus")
                        }
                    }
                    .padding()
                }
            }
        }
    }
