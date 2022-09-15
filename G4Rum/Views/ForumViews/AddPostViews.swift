//
//  AddPostViews.swift
//  G4Rum
//
//  Created by Ngô Xuân Huy on 15/09/2022.
//

import SwiftUI

struct AddPostViews: View {
    @Environment(\.colorScheme) var colorScheme
    
    @State var postView:Bool = false
    @State var title: String = ""
    @State var content = ""
    @Environment(\.dismiss) var dismiss
    @State var textEditorHeight : CGFloat = 20
    let width = UIScreen.main.bounds.width
    let height = UIScreen.main.bounds.height
    
    var body: some View {
        if postView {
            PostListView()
        } else {
            ZStack {
                LinearGradient(gradient: Gradient(colors: colorScheme == .dark ? ColorConstants.colorDarkMode : ColorConstants.colorLightMode),
                               startPoint: .topLeading,
                               endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.all)
                VStack(alignment: .leading) {
                    HStack{
                        Button {
                            postView.toggle()
                        } label: {
                            Text("Cancel")
                        }
                        Spacer()
                        Button {
                            postView.toggle()
                        } label: {
                            Text("Save")
                        }
                    }
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
                        .opacity(0.2)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .disableAutocorrection(true)
                    
                    Divider()
                        .overlay(colorScheme == .dark ? .white : .black)
                        .padding(.top, 15)
                    
                    Text("Content")
                        .font(.system(size: width / 20))
                        .padding(.top, 15)
                    TextEditor(text: $content)
                        .frame(height: height / 10)
                        .opacity(0.2)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .disableAutocorrection(true)
                    Spacer()
                }
                .padding()
            }
            .navigationBarTitle("")
            .navigationBarHidden(true)
        }
    }
}
