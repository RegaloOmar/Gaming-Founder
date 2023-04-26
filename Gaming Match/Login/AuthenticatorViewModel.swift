//
//  AuthenticatorViewModel.swift
//  Gaming Match
//
//  Created by Omar Regalado on 25/04/23.
//

import Foundation
import GoogleSignIn

final class AuthenticatorViewModel: ObservableObject {
    @Published var state: State
    private var authenticator: GoogleSignInAuthenticator {
        return GoogleSignInAuthenticator(authViewModel: self)
    }
    
    init() {
        if let user = GIDSignIn.sharedInstance.currentUser {
            self.state = .singedIn(user)
        } else {
            self.state = .singedOut
        }
    }
    
    func signIn() {
        authenticator.signIn()
    }
    
    func signOut() {
        authenticator.signOut()
    }
    
    func disconnect() {
        authenticator.disconnect()
    }
    
}

extension AuthenticatorViewModel {
    enum State {
        case singedIn(GIDGoogleUser)
        
        case singedOut
    }
}
