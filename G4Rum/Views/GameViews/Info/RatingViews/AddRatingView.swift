//
//  AddRatingView.swift
//  G4Rum
//
//  Created by Nhat, Nguyen Minh on 13/09/2022.
//

import SwiftUI
import FirebaseAuth

struct AddRatingView: View {
    @Environment(\.colorScheme) var colorScheme
    
    var game: Game
    @StateObject private var gameRatingViewModel = GameRatingViewModel()
    @State var addRating : Bool = false
    @Environment(\.dismiss) var dismiss
    
    @State private var rating = 3
    @State private var review = ""
    let width = UIScreen.main.bounds.width
    let height = UIScreen.main.bounds.height
    let user = Auth.auth().currentUser
    var body: some View {
        if addRating {
            AllRatingView(game: game)
        } else {
            ZStack {
                LinearGradient(gradient: Gradient(colors: colorScheme == .dark ? ColorConstants.colorDarkMode : ColorConstants.colorLightMode),
                               startPoint: .topLeading,
                               endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.all)
                VStack(alignment: .leading) {
                    Text("Writing Your Review")
                        .font(.system(size: width / 20))
                        .padding(.top, 15)
                    HStack{
                        Spacer()
                        RatingStarsView(rating: $rating)
                        Spacer()
                    }
                    
                    Divider()
                        .overlay(colorScheme == .dark ? .white : .black)
                        .padding(.top, 15)
                    
                    Text("Review (Optional)")
                        .font(.system(size: width / 20))
                        .padding(.top, 15)
                    TextEditor(text: $review)
                        .frame(height: height / 2)
                        .opacity(0.5)
                        .foregroundColor(colorScheme == .dark ? .white : .black)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .disableAutocorrection(true)
                }
                .padding()
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        addRating.toggle()
                        gameRatingViewModel.addComment(game: game, username: (user?.email)!, text: review, rating: rating)
                    } label: {
                        Text("Save")
                    }
                }
            }
        }
//        NavigationView{
//            Form{
//                Section{
//                    HStack{
//                        Spacer()
//                        RatingStarsView(rating: $rating)
//                        Spacer()
//                    }
//                }.listRowBackground(Color.clear)
//                Section{
//                    TextEditor(text: $review)
//                        .disableAutocorrection(true)
//                }
//                header : {
//                    Text("Review (Optional)")
//                }
//            }
//            .navigationTitle("Writing Your Review")
//            .navigationBarTitleDisplayMode(.inline)
//            .toolbar{
//                ToolbarItem(placement: .navigationBarLeading) {
//                    Button {
//                        print("back")
//                        dismiss()
//                    } label: {
//                        Text("Cancle")
//                    }
//                }
//                ToolbarItem(placement: .navigationBarTrailing){
//                    Button {
//                        print("Complete save")
//                        gameRatingViewModel.addComment(game: game, username: (user?.email)!, text: review, rating: rating)
//                        dismiss()
//                    } label: {
//                        Text("Save")
//                    }
//                }
//            }
//        }
    }
}
