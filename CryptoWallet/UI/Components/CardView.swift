//
//  CardView.swift
//  CryptoWallet
//
//  Created by aternetas on 16.07.2025.
//

import UIKit

final class CardView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .pearl
        layer.cornerRadius = 40
        layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
