//
//  GoogleSignInAuthenticator.swift
//  Gaming Match
//
//  Created by Omar Regalado on 25/04/23.
//

import Foundation
import GoogleSignIn
import Firebase

final class GoogleSignInAuthenticator: ObservableObject {
    private var authViewModel: AuthenticatorViewModel
    
    init(authViewModel: AuthenticatorViewModel) {
        self.authViewModel = authViewModel
    }
    
    func signIn() {
        guard let rootViewController = UIApplication.shared.windows.first?.rootViewController else {
            print("There's not root view controller")
            return
        }
        
        GIDSignIn.sharedInstance.signIn(withPresenting: rootViewController) {result, error in
            guard let signInResult = result else {
              print("Error! \(String(describing: error))")
              return
            }
            
            self.authViewModel.state = .singedIn(signInResult.user)
        }
    }
    
    func signOut() {
        GIDSignIn.sharedInstance.signOut()
        self.authViewModel.state = .singedOut
    }
    
    func disconnect() {
        GIDSignIn.sharedInstance.disconnect{ error in
            if let error = error {
                print("Encountered error disconnecting scope: \(error).")
            }
            self.signOut()
        }
    }
}
