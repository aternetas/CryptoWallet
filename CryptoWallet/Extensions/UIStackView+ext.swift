//
//  UIStackView+ext.swift
//  CryptoWallet
//
//  Created by aternetas on 17.07.2025.
//

import UIKit

extension UIStackView {
    func addArrangedSubviews(_ views: [UIView]) {
        views.forEach { addArrangedSubview($0) }
    }
}
