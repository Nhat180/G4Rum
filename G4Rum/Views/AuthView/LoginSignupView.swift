/*
  RMIT University Vietnam
  Course: COSC2659 iOS Development
  Semester: 2022B
  Assessment: Assignment 3
  Author: NoName Team
  Created  date: 6/9/2022
  Last modified: 18/9/2022
  Acknowledgement:
 - https://www.youtube.com/watch?v=84gRTVNvOz4
 - https://swiftuirecipes.com/blog/swiftui-toast
*/


import SwiftUI

struct LoginSignupView: View {
    @ObservedObject var authViewModel = AuthViewModel()
    
    var body: some View {
        if !authViewModel.isLogin {
            AuthView(authViewModel: authViewModel)
                // for light status bar...
                //.preferredColorScheme(.dark)
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
    @Environment(\.colorScheme) var colorScheme
    @ObservedObject var authViewModel = AuthViewModel()
    @State var index = 0
    
    var body: some View{
        
        GeometryReader{_ in
            ZStack{
                LinearGradient(gradient: Gradient(colors: colorScheme == .dark ? ColorConstants.colorDarkMode : ColorConstants.colorLightMode),
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
//        .background(Color("Color").edgesIgnoringSafeArea(.all))
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
    @Environment(\.colorScheme) var colorScheme
    @ObservedObject var authViewModel = AuthViewModel()
    @State var email = ""
    @State var pass = ""
    @Binding var index : Int
    
    @State var hiddenPassword: Bool = true
    
    @State private var validation = false
    @State var alertStr = ""
    @State private var loginAlert = "Sorry, the mail or password is not correct"
    let width = UIScreen.main.bounds.width
    let height = UIScreen.main.bounds.height
    
    var body: some View{
        ZStack(alignment: .bottom) {
                VStack{
                    HStack{
                        VStack(spacing: 10){
                            Text("Login")
                                .foregroundColor(colorScheme == .dark ? (self.index == 0 ? .white : .gray) : (self.index == 0 ? ColorConstants.darkRed : .gray))
                                .font(.system(size: width / 15))
                                .fontWeight(.bold)
                            
                            Capsule()
                                .fill(colorScheme == .dark ? (self.index == 0 ? .white : Color.clear) : (self.index == 0 ? ColorConstants.darkRed : Color.clear))
                                .frame(width: width / 5, height: 5)
                        }
                        Spacer(minLength: 0)
                    }
                    .padding(.top, 20)// for top curve...
                    
                    VStack{
                        
                        HStack(spacing: 15){
                            Image(systemName: "envelope.fill")
                                .resizable()
                                .frame(width: width / 20 , height: width / 30)
                                .foregroundColor(colorScheme == .dark ? ColorConstants.darkRed : ColorConstants.darkRed)
                            
                            TextField("Email Address", text: self.$email)
                                .disableAutocorrection(true)
                        }
                        
                        Divider().background(Color.white.opacity(0.5))
                    }
                    .padding(.horizontal)
                    .padding(.top, 40)
                    
                    VStack{
                        HStack(spacing: 15){
                            Image(systemName: hiddenPassword ? "eye.slash.fill" : "eye.fill")
                                .resizable()
                                .frame(width: width / 20 , height: width / 30)
                                .foregroundColor(colorScheme == .dark ? ColorConstants.darkRed : ColorConstants.darkRed)
                                .onTapGesture {
                                    hiddenPassword.toggle()
                            }
                            
                            if hiddenPassword {
                                SecureField("Password", text: self.$pass)
                                    .disableAutocorrection(true)
                            } else {
                                TextField("Password", text: self.$pass)
                                    .disableAutocorrection(true)
                            }
                        }
                        
                        Divider().background(Color.white.opacity(0.5))
                    }
                    .padding(.horizontal)
                    .padding(.top, 30)
                    .padding(.bottom, 65)
                    
                }
            .padding()
            // bottom padding...
            .padding(.bottom, 65)
            .background(colorScheme == .dark ? .black : .white)
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
                let checkValidEmail = isValidEmail(testStr: email)
                if email == "" || pass == "" {
                    if email == "" {
                        alertStr = "Please enter the email"
                    } else {
                        alertStr = "Please enter the password"
                    }
                    validation = true
                } else {
                    if checkValidEmail {
                        if pass.count >= 6 {
                            self.authViewModel.signIn(email: email, password: pass)
                        } else {
                            alertStr = "The password is required more than 6 characters"
                            validation = true
                        }
                    } else {
                        alertStr = "The email is invalid"
                        validation = true
                    }
                }
            }) {
                if (authViewModel.authLoading) {
                    ProgressView()
                        .padding(.vertical)
                        .padding(.horizontal, width / 6)
                        .background(colorScheme == .dark ? ColorConstants.darkRed : ColorConstants.darkRed)
                        .clipShape(Capsule())
                        // shadow...
                        .shadow(color: Color.white.opacity(0.1), radius: 5, x: 0, y: 5)
                } else {
                    Text("LOGIN")
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                        .padding(.vertical)
                        .padding(.horizontal, width / 6)
                        .background(colorScheme == .dark ? ColorConstants.darkRed : ColorConstants.darkRed)
                        .clipShape(Capsule())
                        // shadow...
                        .shadow(color: Color.white.opacity(0.1), radius: 5, x: 0, y: 5)
                    
                }
            }
            // moving view down..
            .offset(y: 25)
            .opacity(self.index == 0 ? 1 : 0)
            .disabled(!authViewModel.authLoading ? false : true)
        }
        .toast(message: (authViewModel.errorSignIn) ? loginAlert : alertStr,
               isShowing: (authViewModel.errorSignIn) ? $authViewModel.errorSignIn : $validation,
            duration: Toast.short)
    }
}

// SignUP Page..

struct SignUP : View {
    @Environment(\.colorScheme) var colorScheme
    @ObservedObject var authViewModel = AuthViewModel()
    @State var email = ""
    @State var pass = ""
    @State var rePass = ""
    @Binding var index : Int
    
    @State var hiddenPassword: Bool = true
    @State var hiddenRePassword: Bool = true
    
    @State private var validation = false
    @State var alertStr = ""
    @State private var signUpAlert = "Cannot create account with this mail! Try another, please."
    
    let width = UIScreen.main.bounds.width
    let height = UIScreen.main.bounds.height
    
    var body: some View{
        ZStack(alignment: .bottom) {
            VStack{
                HStack{
                    Spacer(minLength: 0)
                    
                    VStack(spacing: 10){
                        Text("SignUp")
                            .foregroundColor(colorScheme == .dark ? (self.index == 1 ? .white : .gray) : (self.index == 1 ? ColorConstants.darkRed : .gray))
                            .font(.system(size: width / 15))
                            .fontWeight(.bold)
                        
                        Capsule()
                            .fill(colorScheme == .dark ? (self.index == 1 ? .white : Color.clear) : (self.index == 1 ? ColorConstants.darkRed : Color.clear))
                            .frame(width: width / 5, height: 5)
                    }
                }
                .padding(.top, 20)// for top curve...
                
                VStack{
                    HStack(spacing: 15){
                        Image(systemName: "envelope.fill")
                            .resizable()
                            .frame(width: width / 20 , height: width / 30)
                            .foregroundColor(ColorConstants.darkRed)
                        
                        TextField("Email Address", text: self.$email)
                            .disableAutocorrection(true)
                    }
                    
                    Divider().background(Color.white.opacity(0.5))
                }
                .padding(.horizontal)
                .padding(.top, 40)
                
                VStack{
                    HStack(spacing: 15){
                        Image(systemName: hiddenPassword ? "eye.slash.fill" : "eye.fill")
                            .resizable()
                            .frame(width: width / 20 , height: width / 30)
                            .foregroundColor(ColorConstants.darkRed)
                            .onTapGesture {
                                hiddenPassword.toggle()
                            }
                        
                        if hiddenPassword {
                            SecureField("Password", text: self.$pass)
                                .disableAutocorrection(true)
                        } else {
                            TextField("Password", text: self.$pass)
                                .disableAutocorrection(true)
                        }
                    }
                    
                    Divider().background(Color.white.opacity(0.5))
                }
                .padding(.horizontal)
                .padding(.top, 25)
                
                VStack{
                    HStack(spacing: 15){
                        Image(systemName: hiddenRePassword ? "eye.slash.fill" : "eye.fill")
                            .resizable()
                            .frame(width: width / 20 , height: width / 30)
                            .foregroundColor(ColorConstants.darkRed)
                            .onTapGesture {
                                hiddenRePassword.toggle()
                            }
                        
                        if hiddenRePassword {
                            SecureField("Re-password", text: self.$rePass)
                        } else {
                            TextField("Re-password", text: self.$rePass)
                        }
                    }
                    
                    Divider().background(Color.white.opacity(0.5))
                }
                .padding(.horizontal)
                .padding(.top, 30)
            }
            .padding()
            // bottom padding...
            .padding(.bottom, 65)
            .background(colorScheme == .dark ? ColorConstants.darkGray : ColorConstants.gray)
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
                let checkValidEmail = isValidEmail(testStr: email)
                if email == "" || pass == "" || rePass == "" {
                    if email == "" {
                        alertStr = "Please enter the email"
                    } else if pass == "" {
                        alertStr = "Please enter the password"
                    } else {
                        alertStr = "Please enter the re-password"
                    }
                    validation = true
                } else {
                    if checkValidEmail {
                        if pass == rePass && pass.count >= 6 && rePass.count >= 6 {
                            authViewModel.signUp(email: email, password: pass)
                        } else {
                            if pass.count < 6 {
                                alertStr = "The password is required more than 6 characters"
                            } else if rePass.count < 6 {
                                alertStr = "The repassword is required more than 6 characters"
                            } else {
                                alertStr = "The password and repassword are not the same"
                            }
                            validation = true
                        }
                    } else {
                        alertStr = "The email is invalid"
                        validation = true
                    }
                }
            }) {
                if (authViewModel.authLoading) {
                    ProgressView()
                        .padding(.vertical)
                        .padding(.horizontal, width / 6)
                        .background(ColorConstants.darkRed)
                        .clipShape(Capsule())
                        // shadow...
                        .shadow(color: Color.white.opacity(0.1), radius: 5, x: 0, y: 5)
                } else {
                    Text("SIGNUP")
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                        .padding(.vertical)
                        .padding(.horizontal, width / 6)
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
            .disabled(!authViewModel.authLoading ? false : true)
        }
        .toast(message: (authViewModel.errorSignUp) ? signUpAlert : alertStr,
               isShowing: (authViewModel.errorSignUp) ? $authViewModel.errorSignUp : $validation,
            duration: Toast.short)

    }
}

// https://stackoverflow.com/questions/25471114/how-to-validate-an-e-mail-address-in-swift
func isValidEmail(testStr:String) -> Bool {
    let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
    let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
    return emailTest.evaluate(with: testStr)
}
