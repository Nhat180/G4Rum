/*
  RMIT University Vietnam
  Course: COSC2659 iOS Development
  Semester: 2022B
  Assessment: Assignment 2
  Author: Ta Quoc Thang
  ID: 3713564
  Created  date: 22/08/2022
  Last modified : 26/08/2022
  Acknowledgement: https://www.hackingwithswift.com/quick-start/swiftui/how-to-render-a-gradient
*/

import SwiftUI
import FirebaseAuth

struct SplashView: View {
    @StateObject private var authViewModel = AuthViewModel()
    @State var isWelcomeActive: Bool = false
    @AppStorage("_showOnboarding") var showOnboarding: Bool = true
    let user = Auth.auth().currentUser
    
    var body: some View {
        ZStack{
            if self.isWelcomeActive {
                if(!authViewModel.isLogin) {
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
                    LinearGradient(gradient: Gradient(colors: [
                        .black,
                        ColorConstants.darkRed
                    ]),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing)
                    .edgesIgnoringSafeArea(.all)
                    LottieView(fileName: "splash")
                        .frame(width: 180, height: 180, alignment: .center)
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
                authViewModel.updateLogin()
            }
        }
    }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}
