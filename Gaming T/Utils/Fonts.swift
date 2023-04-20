//
//  Fonts.swift
//  Gaming T
//
//  Created by Omar Regalado Mendoza on 19/04/23.
//

import UIKit

//MARK:- CGFloat Standarized Point Sizes
private extension CGFloat {
    static let small: CGFloat = 14.0
    static let normal: CGFloat = 16.0
    static let large: CGFloat = 18.0
    static let xLarge: CGFloat = 20.0
}

//MARK:- Public UIFont Sizes
extension UIFont {
    public static let small = UIFont.systemFont(ofSize: .small)
    public static let normal = UIFont.systemFont(ofSize: .normal)
    public static let large = UIFont.systemFont(ofSize: .large)
    public static let xLarge = UIFont.systemFont(ofSize: .xLarge)
}
