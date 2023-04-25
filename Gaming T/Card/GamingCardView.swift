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
    
    @State private var offset = CGSize.zero
    @State private var backgroundColor: Color = Color(.primaryPurple)
    
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 15)
                .frame(width: 300, height: 570)
                .foregroundColor(backgroundColor)
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
        .offset(x: offset.width, y: offset.height * 0.4)
        .rotationEffect(.degrees(Double(offset.width / 40.0)))
        .gesture(
            DragGesture()
                .onChanged { gesture in
                    offset = gesture.translation
                    withAnimation {
                        changeColor(width: offset.width)
                    }
                }
                .onEnded { _ in
                    withAnimation {
                        swipeCard(width: offset.width)
                    }
                }
        )
    }
    
    private func swipeCard(width: CGFloat) {
        switch width {
            //Gesto para rechazar
        case -500...(-150):
            offset = CGSize(width: -500.0, height: 0.0)
            //Gesto para Match
        case 150...(500):
            offset = CGSize(width: 500.0, height: 0.0)
        default:
            offset = .zero
        }
    }
    
    private func changeColor(width: CGFloat) {
        switch width {
            //Gesto para rechazar
        case -500...(-150):
            backgroundColor = .red
            //Gesto para Match
        case 150...(500):
            backgroundColor = .green
        default:
            backgroundColor = Color(.primaryPurple)
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
            CardsButtons(color: .red, imageTitle: "x.circle")
            Spacer()
            CardsButtons(color: .blue, imageTitle: "arrow.counterclockwise.circle")
            Spacer()
            CardsButtons(color: .primary, imageTitle: "flag.circle")
            Spacer()
            CardsButtons(color: .green, imageTitle: "heart.circle")
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
