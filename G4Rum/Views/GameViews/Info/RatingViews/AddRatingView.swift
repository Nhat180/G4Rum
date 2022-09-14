//
//  AddRatingView.swift
//  G4Rum
//
//  Created by Nhat, Nguyen Minh on 13/09/2022.
//

import SwiftUI
import FirebaseAuth

struct AddRatingView: View {
    var game: Game
    @StateObject private var gameRatingViewModel = GameRatingViewModel()
    @Environment(\.dismiss) var dismiss
    
    @State private var rating = 3
    @State private var review = ""
    let user = Auth.auth().currentUser
    var body: some View {
        NavigationView{
            Form{
                Section{
                    HStack{
                        Spacer()
                        RatingStarsView(rating: $rating)
                        Spacer()
                    }
                }.listRowBackground(Color.clear)
                Section{
                    TextEditor(text: $review)
                        .disableAutocorrection(true)
                }
                header : {
                    Text("Review(Optional)")
                }
            }
            .navigationTitle("Writing Your Review")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        print("back")
                        dismiss()
                    } label: {
                        Text("Cancle")
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing){
                    Button {
                        print("Complete save")
                        gameRatingViewModel.addComment(game: game, username: (user?.email)!, text: review, rating: rating)
                        dismiss()
                    } label: {
                        Text("Save")
                    }
                }
            }
        }
    }
}

//struct AddRatingView_Previews: PreviewProvider {
//    static var previews: some View {
//        AddRatingView()
//    }
//}
