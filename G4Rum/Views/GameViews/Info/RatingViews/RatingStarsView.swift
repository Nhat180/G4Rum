//
//  RatingStarsView.swift
//  G4Rum
//
//  Created by Nhat, Nguyen Minh on 13/09/2022.
//

import SwiftUI

struct RatingStarsView: View {
    @Binding var rating: Int
    
    var label = ""
    var offImage: Image?
    var onImage = Image (systemName: "star.fill")
    
    var offColor = Color.gray
    var onColor = Color.yellow
    
    var maxRating = 5
    var body: some View {
        HStack{
            if label.isEmpty == false {
                Text(label)
                
            }
            
            ForEach(1..<maxRating + 1, id: \.self){ number in
                showStar(for: number)
                    .resizable()
                    .frame(width: 50, height: 50)
                    .foregroundColor(number > rating ? offColor : onColor)
                    
                    .onTapGesture {
                        rating = number
                    }
            }
        }
    }
    
    func showStar(for number: Int) -> Image{
        if number > rating {
            return offImage ?? onImage
        } else {
            return onImage
        }
    }
    }


//struct RatingStarsView_Previews: PreviewProvider {
//    static var previews: some View {
//        RatingStarsView()
//    }
//}
