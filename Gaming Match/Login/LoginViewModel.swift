//
//  LoginViewModel.swift
//  Gaming Match
//
//  Created by Omar Regalado on 24/04/23.
//

import Foundation
import FirebaseAuth
import GoogleSignIn

class LoginViewModel: ObservableObject {
    
    var authViewModel: AuthenticatorViewModel = AuthenticatorViewModel()
    
    init() {}
    
    
    func loginWith(email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) {authResult, error in
            if error != nil {
                print(error?.localizedDescription ?? "Error")
            } else {
                
            }
        }
    }
    
    func createUser(withEmail: String, password: String) {
        Auth.auth().createUser(withEmail: withEmail, password: password) { result, error in 
            guard error == nil else {
                return
            }
            
        }
    }
    
    func loginWithGoogle() {
        authViewModel.signIn()
    }
    
    func logoutGoogle() {
        authViewModel.signOut()
    }
    
}
