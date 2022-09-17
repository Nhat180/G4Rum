//
//  AddPostViews.swift
//  G4Rum
//
//  Created by Ngô Xuân Huy on 15/09/2022.
//

import SwiftUI
import FirebaseAuth

struct AddPostViews: View {
    @StateObject private var postViewModel = PostViewModel()
    @Environment(\.colorScheme) var colorScheme
    
    @State var postView:Bool = false
    @State var title: String = ""
    @State var content = ""
    @Environment(\.dismiss) var dismiss
    @State var textEditorHeight : CGFloat = 20
    var gameID: String
    let user = Auth.auth().currentUser
    let width = UIScreen.main.bounds.width
    let height = UIScreen.main.bounds.height
    
    var body: some View {
        if postView {
            PostListView(gameID: gameID)
        } else {
            ZStack {
                LinearGradient(gradient: Gradient(colors: colorScheme == .dark ? ColorConstants.colorDarkMode : ColorConstants.colorLightMode),
                               startPoint: .topLeading,
                               endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.all)
                VStack(alignment: .leading) {
                    HStack {
                        Image("headphone")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: width / 10, height: width / 10)
                            .clipShape(Rectangle())
                        
                        VStack(alignment: .leading) {
                            Text("Tongnguyen@gmail.com")
                        }
                    }
                    
                    Divider()
                        .overlay(colorScheme == .dark ? .white : .black)
                        .padding(.top, 15)
                    
                    Text("Title")
                        .font(.system(size: width / 20))
                        .padding(.top, 15)
                    TextEditor(text: $title)
                        .frame(height: height / 20)
                        .opacity(0.5)
                        .foregroundColor(colorScheme == .dark ? .white : .black)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .disableAutocorrection(true)
                    
                    Divider()
                        .overlay(colorScheme == .dark ? .white : .black)
                        .padding(.top, 15)
                    
                    Text("Content")
                        .font(.system(size: width / 20))
                        .padding(.top, 15)
                    TextEditor(text: $content)
                        .frame(height: height / 2)
                        .opacity(0.5)
                        .foregroundColor(colorScheme == .dark ? .white : .black)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .disableAutocorrection(true)
                    Spacer()
                }
                .padding()
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        postView.toggle()
                        postViewModel.addPost(gameID: gameID, title: title, content: content, username: (user?.email)!)
                    } label: {
                        Text("Save")
                    }
                }
            }
        }
    }
}
