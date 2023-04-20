//
//  GamingCardView.swift
//  Gaming T
//
//  Created by Omar Regalado Mendoza on 19/04/23.
//

import SwiftUI

struct CardStyles {
    static let profileImageSize: CGFloat = 200.0
    static let gameImageSize: CGFloat = 50.0
    static let profileLineWidth: CGFloat = 5.0
    static let gameLineWidth: CGFloat = 3.0
}

struct GamingCardView: View {
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 20)
                .frame(width: 300, height: 600)
                .foregroundColor(Color(.primaryPurple))
                .overlay(content: {
                    VStack(spacing: 10) {
                        ProfileSection(imageName: "Astroteemo",
                                       gamertag: "Teemo")
                        .offset(x: 0, y: -50)
                        
                        CardDivider()
                        
                        MainGamesView(gamesPlayed: ["Valorant", "LOL"])
                        
                        Spacer()
                        
                      
                    }
                })
            
            
        }
    }
}

struct ProfileSection: View {
    let imageName: String
    let gamertag: String
    
    var body: some View {
        VStack {
            ProfileImage(imageName: imageName)
                
            Text(gamertag)
                .font(.largeTitle)
                .foregroundColor(Color(.primaryBlack))
                .bold()
        }
    }
}

struct ProfileImage: View {
    
    let imageName: String
    
    var body: some View {
        
        Image(imageName)
            .resizable()
            .frame(width: CardStyles.profileImageSize,
                   height: CardStyles.profileImageSize)
            .aspectRatio(contentMode: .fill)
            .clipShape(Circle())
            .overlay {
                Circle()
                    .stroke(lineWidth: CardStyles.profileLineWidth)
                    .foregroundColor(Color(.primaryBlue))
            }
            .shadow(radius: 10)
    }
}

struct MainGamesView: View {
    let rows = [GridItem(.fixed(50))]
    let gamesPlayed: [String]
    
    var body: some View {
        VStack(spacing: 10) {
            Text("Main Games")
                .font(.title2)
                .foregroundColor(Color(.primaryBlack))
                .bold()
            HStack {
                ForEach(gamesPlayed, id: \.self) {
                    GamesListView(gameName: $0)
                }
            }
            
        }
    }
}

struct GamesListView: View {
    
    let gameName: String
    
    var body: some View {
        Image(gameName)
            .resizable()
            .frame(width: CardStyles.gameImageSize,
                   height: CardStyles.gameImageSize)
            .clipShape(Circle())
            .overlay {
                Circle()
                    .stroke(lineWidth: CardStyles.gameLineWidth)
                    .foregroundColor(Color(.primaryBlue))
            }
    }
}


struct GamingCard_Previews: PreviewProvider {
    static var previews: some View {
        GamingCardView()
            .preferredColorScheme(.dark)
    }
}
