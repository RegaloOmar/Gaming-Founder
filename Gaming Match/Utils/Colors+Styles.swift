//
//  Colors+Styles.swift
//  Gaming T
//
//  Created by Omar Regalado Mendoza on 19/04/23.
//

import UIKit

//MARK:- Convenience inits
public extension UIColor {
    
    convenience init(red: Int, green: Int, blue: Int, alpha: CGFloat = 1.0) {
        self.init(red: CGFloat(red)/255, green: CGFloat(green)/255, blue: CGFloat(blue)/255, alpha: alpha)
    }
    
    convenience init(hex: Int, alpha: CGFloat = 1.0 ) {
        self.init(red: (hex >> 16) & 0xFF, green: (hex >> 8) & 0xFF, blue: hex & 0xFF, alpha: alpha)
    }
    
}

//MARK:- Primary Colors
public extension UIColor {
    static let primaryPurple = UIColor(hex: 0x6441A5)
    static let primaryBlue = UIColor(hex: 0x0E9DD9)
    static let primaryBlack  = UIColor(hex: 0x19171C)
}


