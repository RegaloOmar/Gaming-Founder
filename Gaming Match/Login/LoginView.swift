//
//  LoginView.swift
//  Gaming Match
//
//  Created by Omar Regalado on 24/04/23.
//

import SwiftUI
import GoogleSignInSwift
import GoogleSignIn

struct LoginView: View {
    @StateObject private var loginViewModel: LoginViewModel = LoginViewModel()
    @State var user: String = ""
    @State var password: String = ""
    
    
    let purple = Color(.primaryPurple)
    
    var body: some View {
        VStack {
            Text("Sign up or Login")
                .font(.system(.largeTitle,
                              design: .rounded,
                              weight: .bold))
                .foregroundColor(purple)
            
            VStack {
                VStack (alignment: .leading, spacing: 10.0) {
                    
                    Text("Email")
                        .font(.title3)
                        .foregroundColor(purple)
                    
                    TextField("User", text: $user)
                        .font(.system(size: 17.0, weight: .light))
                        .foregroundColor(Color(.primaryPurple))
                        .frame(height: 44)
                        .padding(.horizontal, 12)
                        .background(Color.white)
                        .cornerRadius(4.0)
                    
                }
                
                VStack(alignment: .leading) {
                    Text("Password")
                        .font(.title3)
                        .foregroundColor(purple)
                    
                    SecureField("Password", text: $password)
                        .font(.system(size: 17.0, weight: .light))
                        .foregroundColor(Color(.primaryPurple))
                        .frame(height: 44)
                        .padding(.horizontal, 12)
                        .background(Color.white)
                        .cornerRadius(4.0)
                    
                }
                
                Button{
                    loginViewModel.createUser(withEmail: user, password: password)
                } label: {
                    RoundedRectangle(cornerRadius: 10)
                        .frame(height: 50)
                        .foregroundColor(Color(.primaryPurple))
                        .overlay {
                            Text("Sign Up")
                                .font(.system(.title, design: .rounded, weight: .bold))
                                .foregroundColor(Color(.primaryBlack))
                        }
                }
                .padding(.vertical, 20)
                
                
            }
            
            HStack(alignment: .center) {
               
                Text("OR")
                    .font(.system(.largeTitle,
                                  design: .rounded,
                                  weight: .bold))
                    .foregroundColor(Color(.primaryPurple))
            }
            
            VStack {
                Button{
                    
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .fill(.orange)
                            .frame(height: 50, alignment: .leading)
                            .overlay {
                                HStack(alignment: .center) {
                                    Image(systemName: "envelope")
                                        .resizable()
                                        .foregroundColor(.primary)
                                    .frame(width: 30,
                                           height: 25,
                                           alignment: .leading)
                                    
                                    Text("Login with Email/Password")
                                        .font(.system(.headline, design: .default, weight: .bold))
                                        .foregroundColor(.primary)
                                    
                                    Spacer()
                                }
                                .padding(.horizontal, 15)
                            }
                    }
                }.padding(.vertical)
                
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(.primary)
                        .frame(height: 50, alignment: .leading)
                        .overlay {
                            HStack(alignment: .center) {
                                Image("Google Logo")
                                    .resizable()
                                .frame(width: 30,
                                       height: 25,
                                       alignment: .leading)
                                
                                Text("Login with Google")
                                    .font(.system(.headline, design: .default, weight: .bold))
                                    .foregroundColor(Color(.primaryBlack))
                                
                                Spacer()
                            }
                            .padding(.horizontal, 15)
                        }
                }
                
            }
            
            Spacer()
        }
        .preferredColorScheme(.dark)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
