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

struct RatingRowView: View {
    var rating: Comment
    let width = UIScreen.main.bounds.width
    let height = UIScreen.main.bounds.height
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(rating.username)
                    .font(.system(size: width / 25))
                Spacer()
                Text(rating.createdDate)
                    .font(.system(size: width / 25))
                    .frame(alignment: .topTrailing)
                    .opacity(0.5)
            }
            StarsView(rating: CGFloat(rating.rating))
            Text(rating.text)
                .font(.system(size: width / 25))
                .opacity(0.5)
        }
        .padding()
        .background(Color.gray.opacity(0.2))
        .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}
