//
//  ColorConstants.swift
//  assignment1
//
//  Created by Thang, Ta Quoc on 01/08/2022.
//

import Foundation
import SwiftUI

struct OnboardingView: View{
    @Environment(\.colorScheme) var colorScheme
    
    @Binding var showOnboarding: Bool
    
    var body: some View{
        ZStack{
            LinearGradient(gradient: Gradient(colors: colorScheme == .dark ? ColorConstants.colorDarkMode : ColorConstants.colorLightMode),
            startPoint: .topLeading,
            endPoint: .bottomTrailing)
            .edgesIgnoringSafeArea(.all)
            TabView{
                ScreenView(title: "About us", detail: "This app created by NoName Team since Sep 2022", fileName: "team", showsDismissButton: false,
                           showOnboarding: $showOnboarding)
                
                ScreenView(title: "Purpose", detail: "We create a community for everyone who loves games", fileName: "social", showsDismissButton: false,
                           showOnboarding: $showOnboarding)
                
                ScreenView(title: "Rating", detail: "Feel free and enjoy your experience", fileName: "rating", showsDismissButton: true,
                           showOnboarding: $showOnboarding)
            }
            
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
            .onAppear {
                UIPageControl.appearance().currentPageIndicatorTintColor = .black
                UIPageControl.appearance().pageIndicatorTintColor = UIColor.black.withAlphaComponent(0.2)
            }
        }
        .accentColor(colorScheme == .dark ? .white : .black)
    }
}
          
struct ScreenView: View{
    let title: String
    let detail: String
    let fileName: String
    let showsDismissButton: Bool
    @Binding var showOnboarding: Bool
    let width = UIScreen.main.bounds.width
    let height = UIScreen.main.bounds.height
    
    var body: some View{
        VStack{
            Text(title)
                .bold()
                .font(.system(size: width / 10))
                .padding()
            
            LottieView(fileName: fileName)
                .frame(width: width / 2, height: width / 2, alignment: .center)
            
            Text(detail)
                .font(.system(size: width / 20))
                .multilineTextAlignment(.center)
                .opacity(0.5)
                .padding()
            
            if showsDismissButton{
                Button(action: {
                    showOnboarding.toggle()
                }, label: {
                    Capsule()
                        .fill(Color.white.opacity(0.2))
                        .frame(width: width / 2, height: width / 10)
                        .overlay(Text("Get Started")
                        .font(.system(size: width / 20))
                        .fontWeight(.bold))
                })
                
            }
        }
    }
}
