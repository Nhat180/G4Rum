//
//  LoginSignupView.swift
//  G4Rum
//
//  Created by Thang, Ta Quoc on 06/09/2022.
//

import SwiftUI

struct LoginSignupView: View {
    @StateObject private var authViewModel = AuthViewModel()
    
    var body: some View {
        if !authViewModel.isLogin {
            AuthView(authViewModel: authViewModel)
                // for light status bar...
                .preferredColorScheme(.dark)
        } else {
            HomeView(authViewModel: authViewModel)
        }
    }
}

struct LoginSignupView_Previews: PreviewProvider {
    static var previews: some View {
        LoginSignupView()
    }
}

struct AuthView : View {
    @ObservedObject var authViewModel = AuthViewModel()
    @State var index = 0
    
    var body: some View{
        
        GeometryReader{_ in
            ZStack{
                LinearGradient(gradient: Gradient(colors: [
                    .black,
                    ColorConstants.darkRed
                ]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.all)
                VStack{
                    ZStack{
                        
                        SignUP(authViewModel: authViewModel, index: self.$index)
                            // changing view order...
                            .zIndex(Double(self.index))
                        
                        Login(authViewModel: authViewModel, index: self.$index)

                    }
                }
                .padding(.vertical)
            }
        }
        .background(Color("Color").edgesIgnoringSafeArea(.all))
    }
}

// Curve...
struct CShape : Shape {
    
    func path(in rect: CGRect) -> Path {
        
        return Path{path in

            // right side curve...
            path.move(to: CGPoint(x: rect.width, y: 100))
            path.addLine(to: CGPoint(x: rect.width, y: rect.height))
            path.addLine(to: CGPoint(x: 0, y: rect.height))
            path.addLine(to: CGPoint(x: 0, y: 0))
            
        }
    }
}


struct CShape1 : Shape {
    
    func path(in rect: CGRect) -> Path {
        
        return Path{path in

            // left side curve...
            
            path.move(to: CGPoint(x: 0, y: 100))
            path.addLine(to: CGPoint(x: 0, y: rect.height))
            path.addLine(to: CGPoint(x: rect.width, y: rect.height))
            path.addLine(to: CGPoint(x: rect.width, y: 0))
            
        }
    }
}

struct Login : View {
    @ObservedObject var authViewModel = AuthViewModel()
    @State var email = ""
    @State var pass = ""
    @Binding var index : Int
    
    
    var body: some View{
        
        ZStack(alignment: .bottom) {
            
                VStack{
                    
                    HStack{
                        
                        VStack(spacing: 10){
                            
                            Text("Login")
                                .foregroundColor(self.index == 0 ? .white : .gray)
                                .font(.title)
                                .fontWeight(.bold)
                            
                            Capsule()
                                .fill(self.index == 0 ? .white : Color.clear)
                                .frame(width: 100, height: 5)
                        }
                        
                        Spacer(minLength: 0)
                    }
                    .padding(.top, 20)// for top curve...
                    
                    VStack{
                        
                        HStack(spacing: 15){
                            
                            Image(systemName: "envelope.fill")
                                .foregroundColor(ColorConstants.darkRed)
                            
                            TextField("Email Address", text: self.$email)
                        }
                        
                        Divider().background(Color.white.opacity(0.5))
                    }
                    .padding(.horizontal)
                    .padding(.top, 40)
                    
                    VStack{
                        
                        HStack(spacing: 15){
                            
                            Image(systemName: "eye.slash.fill")
                                .foregroundColor(ColorConstants.darkRed)
                            
                            SecureField("Password", text: self.$pass)
                        }
                        
                        Divider().background(Color.white.opacity(0.5))
                    }
                    .padding(.horizontal)
                    .padding(.top, 30)
                    
                    HStack{
                        
                        Spacer(minLength: 0)
                        
                        Button(action: {
                            
                        }) {
                            
                            Text("Forget Password?")
                                .foregroundColor(Color.white.opacity(0.6))
                        }
                    }
                    .padding(.horizontal)
                    .padding(.top, 30)
                }
            .padding()
            // bottom padding...
            .padding(.bottom, 65)
            .background(Color("Color2"))
            .clipShape(CShape())
            .contentShape(CShape())
            .shadow(color: Color.black.opacity(0.3), radius: 5, x: 0, y: -5)
            .onTapGesture {
            
                self.index = 0
                    
            }
            .cornerRadius(35)
            .padding(.horizontal,20)
            
            // Button...
            
            Button(action: {
                self.authViewModel.signIn(email: email, password: pass)
            }) {
                if (authViewModel.authLoading) {
                    ProgressView()
                        .padding(.vertical)
                        .padding(.horizontal, 55)
                        .background(ColorConstants.darkRed)
                        .clipShape(Capsule())
                        // shadow...
                        .shadow(color: Color.white.opacity(0.1), radius: 5, x: 0, y: 5)
                } else {
                    Text("LOGIN")
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                        .padding(.vertical)
                        .padding(.horizontal, 55)
                        .background(ColorConstants.darkRed)
                        .clipShape(Capsule())
                        // shadow...
                        .shadow(color: Color.white.opacity(0.1), radius: 5, x: 0, y: 5)
                    
                }
            }
            // moving view down..
            .offset(y: 25)
            .opacity(self.index == 0 ? 1 : 0)
            .disabled(!authViewModel.authLoading && !email.isEmpty && !pass.isEmpty ? false : true)
        }
    }
}

// SignUP Page..

struct SignUP : View {
    @ObservedObject var authViewModel = AuthViewModel()
    @State var email = ""
    @State var pass = ""
    @State var Repass = ""
    @Binding var index : Int
    
    var body: some View{
        
        ZStack(alignment: .bottom) {
            
            VStack{
                
                HStack{
                    
                    Spacer(minLength: 0)
                    
                    VStack(spacing: 10){
                        
                        Text("SignUp")
                            .foregroundColor(self.index == 1 ? .white : .gray)
                            .font(.title)
                            .fontWeight(.bold)
                        
                        Capsule()
                            .fill(self.index == 1 ? .white : Color.clear)
                            .frame(width: 100, height: 5)
                    }
                }
                .padding(.top, 20)// for top curve...
                
                VStack{
                    
                    HStack(spacing: 15){
                        
                        Image(systemName: "person.fill")
                        .foregroundColor(ColorConstants.darkRed)
                        
                        TextField("Username", text: self.$email)
                    }
                    
                    Divider().background(Color.white.opacity(0.5))
                }
                .padding(.horizontal)
                .padding(.top, 40)
                
                VStack{
                    
                    HStack(spacing: 15){
                        
                        Image(systemName: "envelope.fill")
                        .foregroundColor(ColorConstants.darkRed)
                        
                        SecureField("Email Address", text: self.$pass)
                    }
                    
                    Divider().background(Color.white.opacity(0.5))
                }
                .padding(.horizontal)
                .padding(.top, 30)
                
                // replacing forget password with reenter password...
                // so same height will be maintained...
                
                VStack{
                    
                    HStack(spacing: 15){
                        
                        Image(systemName: "eye.slash.fill")
                        .foregroundColor(ColorConstants.darkRed)
                        
                        SecureField("Password", text: self.$Repass)
                    }
                    
                    Divider().background(Color.white.opacity(0.5))
                }
                .padding(.horizontal)
                .padding(.top, 30)
            }
            .padding()
            // bottom padding...
            .padding(.bottom, 65)
            .background(Color("Color2"))
            .clipShape(CShape1())
            // clipping the content shape also for tap gesture...
            .contentShape(CShape1())
            // shadow...
            .shadow(color: Color.black.opacity(0.3), radius: 5, x: 0, y: -5)
            .onTapGesture {
            
                self.index = 1
                    
            }
            .cornerRadius(35)
            .padding(.horizontal,20)
            
            // Button...
            
            Button(action: {
                authViewModel.signUp(email: email, password: pass)
            }) {
                if (authViewModel.authLoading) {
                    ProgressView()
                        .padding(.vertical)
                        .padding(.horizontal, 55)
                        .background(ColorConstants.darkRed)
                        .clipShape(Capsule())
                        // shadow...
                        .shadow(color: Color.white.opacity(0.1), radius: 5, x: 0, y: 5)
                } else {
                    Text("SIGNUP")
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                        .padding(.vertical)
                        .padding(.horizontal, 55)
                        .background(ColorConstants.darkRed)
                        .clipShape(Capsule())
                        // shadow...
                        .shadow(color: Color.white.opacity(0.1), radius: 5, x: 0, y: 5)
                    
                }
            }
            // moving view down..
            .offset(y: 25)
            // hiding view when its in background...
            // only button...
            .opacity(self.index == 1 ? 1 : 0)
        }
    }
}

