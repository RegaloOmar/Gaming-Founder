//
//  LoginView.swift
//  Gaming Match
//
//  Created by Omar Regalado on 24/04/23.
//

import SwiftUI
import FirebaseAuth

struct LoginView: View {
    
    @State var user: String = ""
    @State var password: String = ""
    let purple = Color(.primaryPurple)
    
    var body: some View {
        VStack {
            Text("Login with")
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
                    
                } label: {
                    Text("Login")
                }
                .padding()
                
                
            }
            
            HStack(alignment: .center) {
               
                Text("OR")
                    .font(.system(.largeTitle,
                                  design: .rounded,
                                  weight: .bold))
                    .foregroundColor(Color(.primaryPurple))
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
