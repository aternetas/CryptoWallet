//
//  UIView+ext.swift
//  CryptoWallet
//
//  Created by aternetas on 15.07.2025.
//

import UIKit

extension UIView {
    func addSubviews(_ views: [UIView]) {
        views.forEach { addSubview($0) }
    }
}
