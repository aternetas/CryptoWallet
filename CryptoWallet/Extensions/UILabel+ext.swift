//
//  UILabel+ext.swift
//  CryptoWallet
//
//  Created by aternetas on 15.07.2025.
//

import UIKit

extension UILabel {
    convenience init(text: String = "", font: UIFont = .regular15, textColor: UIColor = .black) {
        self.init()
        self.text = text
        self.font = font
        self.textColor = textColor
    }
}
