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
            RoundedRectangle(cornerRadius: 15)
                .frame(width: 300, height: 570)
                .foregroundColor(Color(.primaryPurple))
                .overlay(content: {
                    VStack(spacing: 15) {
                        
                        ProfileSection(imageName: "Astroteemo",
                                       gamertag: "Teemo")
                        
                        CardDivider()
                        
                        SectionView(SectionList: ["Valorant", "LOL"],
                                    sectionTitle: "Main Games")
                        
                        CardDivider()
                        
                        SectionView(SectionList: ["Xbox", "PlayStation", "Steam"],
                                    sectionTitle: "Favorite Platforms")
                        
                        CardDivider()
                        
                        ButtonsSection()
                            .padding(.horizontal, 15.0)
                            .offset(x: 0, y: 40)
                        
                        Spacer()
                        
                      
                    }
                    .offset(x: 0, y: -50)
                })
        }
        .shadow(radius: 10)
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

struct SectionView: View {
    let SectionList: [String]
    let sectionTitle: String
    
    var body: some View {
        VStack(spacing: 10) {
            Text(sectionTitle)
                .font(.title2)
                .foregroundColor(Color(.primaryBlack))
                .bold()
            HStack {
                ForEach(SectionList, id: \.self) {
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
            .aspectRatio(contentMode: .fill)
            .frame(width: CardStyles.gameImageSize,
                   height: CardStyles.gameImageSize)
            .clipShape(Circle())
            .overlay {
                Circle()
                    .stroke(lineWidth: CardStyles.gameLineWidth)
                    .foregroundColor(Color(.primaryBlue))
            }
            .shadow(radius: 5)
    }
}

struct ButtonsSection: View {
    
    var body: some View {
        HStack {
            CardsButtons(color: .yellow, imageTitle: "x.circle")
            Spacer()
            CardsButtons(color: .blue, imageTitle: "arrow.counterclockwise.circle")
            Spacer()
            CardsButtons(color: .primary, imageTitle: "flag.circle")
            Spacer()
            CardsButtons(color: .red, imageTitle: "heart.circle")
        }
    }
}

struct CardsButtons: View {
    
    let color: Color
    let imageTitle: String
    
    var body: some View {
        Button {
            
        } label: {
            Image(systemName: imageTitle)
                .resizable()
                .frame(width: 50, height: 50)
                .foregroundColor(color)
        }
    }
}


struct GamingCard_Previews: PreviewProvider {
    static var previews: some View {
        GamingCardView()
            .preferredColorScheme(.dark)
    }
}
