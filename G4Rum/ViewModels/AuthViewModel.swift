//
//  AuthViewModel.swift
//  G4Rum
//
//  Created by Nhat, Nguyen Minh on 08/09/2022.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift
import FirebaseAuth

class AuthViewModel: ObservableObject {
    @Published var authLoading = false
    @Published var isLogin = false
    @Published var errorSignIn = false
    @Published var errorSignUp = false
    
    func signUp(email: String, password: String) {
        self.authLoading = true
        Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
            guard error == nil else {
                print(error?.localizedDescription ?? "")
                self.authLoading = false
                self.errorSignUp = true
                return
            }
            switch result {
                case .none:
                    print("Could not create account.")
                    self.authLoading = false
                    self.errorSignUp = true
                case .some(_):
                    print("User created")
                    self.authLoading = false
                    self.isLogin = true
            }
        }
    }
    
    func signIn(email: String, password: String) {
        self.authLoading = true
        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
            if error != nil {
                print(error?.localizedDescription ?? "")
                self.errorSignIn = true
                self.authLoading = false
            } else {
                print("success")
                self.errorSignIn = false
                self.authLoading = false
                guard let user = result?.user else {
                        print("No user")
                        return
                }
                print("Signed in as user \(user.uid), with email: \(user.email ?? "")")
                self.isLogin = true
            }
        }
    }
    
    func updateLogin() {
        self.isLogin = true
    }
    
    func signOut() {
        do {
            self.isLogin = false
            self.authLoading = false
            self.errorSignIn = false
            self.errorSignUp = false
            try Auth.auth().signOut()
        } catch {
            print("already logged out")
                
        }
    }
}
