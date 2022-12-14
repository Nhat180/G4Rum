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

struct AddPostViews: View {
    @StateObject private var postViewModel = PostViewModel()
    @Environment(\.colorScheme) var colorScheme
    
    @State var postView:Bool = false
    @State var title: String = ""
    @State var content = ""
    @State private var validation = false
    @State var alertStr = ""
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
                            Text((user?.email)!)
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
                        if (title == "" || content == "") {
                            if (title == "") {
                                alertStr = "Please enter the title of the post"
                            } else {
                                alertStr = "Please put some content for the post"
                            }
                            validation = true
                        } else {
                            postView.toggle()
                            postViewModel.addPost(gameID: gameID, title: title, content: content, username: (user?.email)!)
                        }
                    } label: {
                        Text("Save")
                    }
                }
            }.toast(message: alertStr, isShowing: $validation, duration: Toast.short)
        }
    }
}
