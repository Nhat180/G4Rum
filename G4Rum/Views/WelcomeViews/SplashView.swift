/*
  RMIT University Vietnam
  Course: COSC2659 iOS Development
  Semester: 2022B
  Assessment: Assignment 3
  Author: NoName Team
  Created  date: 5/9/2022
  Last modified : 18/9/2022
  Acknowledgement: https://www.hackingwithswift.com/quick-start/swiftui/how-to-render-a-gradient
*/

import SwiftUI
import FirebaseAuth

struct SplashView: View {
    @Environment(\.colorScheme) var colorScheme
    @StateObject private var authViewModel = AuthViewModel()
    @State var isWelcomeActive: Bool = false
    @AppStorage("_showOnboarding") var showOnboarding: Bool = true
    let user = Auth.auth().currentUser
    let width = UIScreen.main.bounds.width
    
    var body: some View {
        ZStack{
            if self.isWelcomeActive { 
                if(!authViewModel.isLogin || showOnboarding) {
                    LoginSignupView(authViewModel: authViewModel)
                        .fullScreenCover(isPresented: $showOnboarding, content: {
                            OnboardingView(showOnboarding: $showOnboarding)
                        })
                } else {
                    HomeView(authViewModel: authViewModel)
                    //GameListView() // đang test nên đừng xoá
                }
                
            } else {
                ZStack{
                    LinearGradient(gradient: Gradient(colors: colorScheme == .dark ? ColorConstants.colorDarkMode : ColorConstants.colorLightMode),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing)
                    .edgesIgnoringSafeArea(.all)
                    LottieView(fileName: "splash")
                        .frame(width: width / 5 * 2, height: width / 5 * 2, alignment: .center)
                }
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.8) {
                withAnimation {
                    self.isWelcomeActive = true
                }
            }
            if (user != nil) {
                if (!showOnboarding) {
                    authViewModel.updateLogin()
                }
                if (showOnboarding) {
                    authViewModel.signOut()
                }
            }
        }
    }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}
