//
//  PoppinsFont.swift
//  CryptoWallet
//
//  Created by aternetas on 12.07.2025.
//

import UIKit

extension UIFont {
    static var regular15 = UIFont(type: .regular, size: 15)
    
    static var medium14 = UIFont(type: .medium, size: 14)
    static var medium18 = UIFont(type: .medium, size: 18)
    static var medium20 = UIFont(type: .medium, size: 20)
    
    static var semibold14 = UIFont(type: .semibold, size: 14)
    static var semibold15 = UIFont(type: .semibold, size: 15)
    static var semibold28 = UIFont(type: .semibold, size: 28)
    static var semibold32 = UIFont(type: .semibold, size: 32)
    
    enum MyFont {
        case regular, medium, semibold
        
        var name: String {
            switch self {
            case .regular:
                "Poppins-Regular"
            case .medium:
                "Poppins-Medium"
            case .semibold:
                "Poppins-SemiBold"
            }
        }
    }
    
    convenience init(type: MyFont, size: CGFloat) {
        self.init(name: type.name, size: size)!
    }
}
