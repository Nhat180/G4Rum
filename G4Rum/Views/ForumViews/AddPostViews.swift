//
//  AddPostViews.swift
//  G4Rum
//
//  Created by Ngô Xuân Huy on 15/09/2022.
//

import SwiftUI

struct AddPostViews: View {
    @State var postView:Bool = false
    @State var title: String = ""
    @State var content = ""
    @Environment(\.dismiss) var dismiss
    @State var textEditorHeight : CGFloat = 20
    
    var body: some View {
        
        if postView {
            PostListView()
        } else {
            ZStack {
                VStack(alignment: .leading) {
                    HStack{
                        Button {
                            postView.toggle()
                        } label: {
                            Label("back", systemImage: "plus")
                        }
                    }
                    HStack {
                        Image("headphone")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 50, height: 50)
                            .clipShape(Rectangle())
                        
                        VStack(alignment: .leading) {
                            Text("Tongnguyen@gmail.com")
                                .font(.headline)
                            .foregroundColor(.secondary)
                        }
                        Spacer()
                    }
                    
                    Text("Title")
                    TextField("Enter a short title", text: $title)
                        .padding()
                        .background(Color(red: 255.0/255.0, green: 244.0/255.0, blue: 233.0/255.0, opacity: 1.0))
                        .cornerRadius(10.0)
                        .disableAutocorrection(true)
                    
                    Text("Content")
                    TextEditor(text: $content)
                                    .foregroundColor(.secondary)
                                    .frame(height: max(200,textEditorHeight))
                                    .padding(.horizontal)
                                    .colorMultiply(Color(red: 255.0/255.0, green: 244.0/255.0, blue: 233.0/255.0, opacity: 1.0))
                                    .disableAutocorrection(true)

                    HStack {
                        Spacer()
                        Button {
                            postView.toggle()
                        } label: {
                            Label("Save", systemImage: "plus")
                    }
                        Spacer()
                    }
                    Spacer()

                }
                .padding()


            }
                }
                
            }
            
        }
