//
//  UIApplication+ext.swift
//  CryptoWallet
//
//  Created by aternetas on 17.07.2025.
//

import UIKit

extension UIApplication {
    var firstKeyWindow: UIWindow? {
        UIApplication.shared.connectedScenes
            .compactMap { $0 as? UIWindowScene }
            .filter { $0.activationState == .foregroundActive }
            .first?.keyWindow
    }
}
