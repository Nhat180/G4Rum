/*
  RMIT University Vietnam
  Course: COSC2659 iOS Development
  Semester: 2022B
  Assessment: Assignment 3
  Author: NoName Team
  Created  date: 13/9/2022
  Last modified: 18/9/2022
  Acknowledgement: Acknowledge the resources that you use here.
*/

import SwiftUI

struct RatingStarsView: View {
    @Binding var rating: Int
    
    var label = ""
    var offImage: Image?
    var onImage = Image (systemName: "star.fill")
    
    var offColor = Color.gray
    var onColor = Color.yellow
    
    var maxRating = 5
    
    let width = UIScreen.main.bounds.width
    let height = UIScreen.main.bounds.height
    var body: some View {
        HStack{
            if label.isEmpty == false {
                Text(label)
                
            }
            
            ForEach(1..<maxRating + 1, id: \.self){ number in
                showStar(for: number)
                    .resizable()
                    .frame(width: width / 10, height: width / 10)
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
