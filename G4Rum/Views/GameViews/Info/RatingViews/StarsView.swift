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

struct StarsView: View {
    let rating: CGFloat
    var width: CGFloat
    var size: CGFloat
    
    init (rating: CGFloat){
        self.rating = rating
        width = UIScreen.main.bounds.width
        size = width / 20
    }
    
    var body: some View {
        let text = HStack(spacing: 0) {
            Image(systemName: "star.fill")
                .resizable()
                .frame(width: size, height: size, alignment: .center)
                
            Image(systemName: "star.fill")
                .resizable()
                .frame(width: size, height: size, alignment: .center)
                
            Image(systemName: "star.fill")
                .resizable()
                .frame(width: size, height: size, alignment: .center)
                
            Image(systemName: "star.fill")
                .resizable()
                .frame(width: size, height: size, alignment: .center)
                
            Image(systemName: "star.fill")
                .resizable()
                .frame(width: size, height: size, alignment: .center)
        }

        ZStack {
            text
            HStack(content: {
                GeometryReader(content: { geometry in
                    HStack(spacing: 0, content: {
                        let width1 = self.valueForWidth(geometry.size.width, value: rating)
                        let width2 = self.valueForWidth(geometry.size.width, value: (5 - rating))
                        Rectangle()
                            .frame(width: width1, height: geometry.size.height, alignment: .center)
                            .foregroundColor(.yellow)
                        
                        Rectangle()
                            .frame(width: width2, height: geometry.size.height, alignment: .center)
                            .foregroundColor(.gray)
                    })
                })
                .frame(width: size * 5, height: size, alignment: .trailing)
            })
            .mask(
                text
            )
        }
        .frame(width: size * 5, height: size, alignment: .leading)
    }
    
    func valueForWidth(_ width: CGFloat, value: CGFloat) -> CGFloat {
        value * width / 5
    }
}

//struct StarsView_Previews: PreviewProvider {
//    static var previews: some View {
//        StarsView()
//    }
//}
