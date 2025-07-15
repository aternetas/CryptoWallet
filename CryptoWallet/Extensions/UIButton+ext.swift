//
//  UIButton+ext.swift
//  CryptoWallet
//
//  Created by aternetas on 15.07.2025.
//

import UIKit

extension UIButton {
    convenience init(text: String = "",
                     textColor: UIColor = .white,
                     font: UIFont = .regular15,
                     backgroundColor: UIColor = .black,
                     cornerRadius: CGFloat = 0.0) {
        self.init()
        setTitle(text, for: .normal)
        setTitleColor(textColor, for: .normal)
        setTitleColor(textColor, for: .highlighted)
        
        layer.cornerRadius = cornerRadius
        
        var configuration = UIButton.Configuration.filled()
        configuration.cornerStyle = .capsule
        configuration.baseBackgroundColor = backgroundColor
        
        configuration.titleTextAttributesTransformer = UIConfigurationTextAttributesTransformer { incoming in
            var outgoing = incoming
            outgoing.font = font
            return outgoing
        }
        
        self.configuration = configuration
    }
}
