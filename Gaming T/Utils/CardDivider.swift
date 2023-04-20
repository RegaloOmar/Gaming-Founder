//
//  CardDivider.swift
//  Gaming T
//
//  Created by Omar Regalado Mendoza on 19/04/23.
//

import SwiftUI

struct CardDivider: View {
    var body: some View {
        Rectangle()
            .fill(LinearGradient(colors: [Color(.primaryBlue), Color(.primaryBlack)], startPoint: .leading, endPoint: .trailing))
            .frame(width: 290, height: 1.5)
            
    }
}

struct CardDivider_Previews: PreviewProvider {
    static var previews: some View {
        CardDivider()
    }
}
