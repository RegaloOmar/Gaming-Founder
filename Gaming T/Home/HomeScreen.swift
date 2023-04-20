//
//  HomeScreen.swift
//  Gaming T
//
//  Created by Omar Regalado Mendoza on 20/04/23.
//

import SwiftUI

struct HomeScreen: View {
    var body: some View {
        Rectangle()
            .fill(
                LinearGradient(
                    colors: [Color(.primaryBlue), Color(.primaryBlack) ],
                    startPoint: .topLeading, endPoint: .bottomTrailing
                )
            )
            .edgesIgnoringSafeArea(.all)
            .overlay {
                GamingCardView()
            }
            
    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}
