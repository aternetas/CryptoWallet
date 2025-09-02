//
//  CustomSegmentedControlButton.swift
//  CryptoWallet
//
//  Created by aternetas on 21.07.2025.
//

import UIKit

final class CustomSegmentedControlButton: UIButton {
    let index: Int
    let title: String
    
    var isSelectedButton: Bool {
        didSet {
            backgroundColor = isSelectedButton ? .white.withAlphaComponent(0.8) : .clear
            setTitleColor(isSelectedButton ? .black : .darkGray, for: .normal)
        }
    }
    
    init(button: CustomSegmentedControlButtonProtocol) {
        index = button.index
        title = button.title
        isSelectedButton = index == 0
        
        super.init(frame: .zero)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setStartSelectedIndex() {
        isSelectedButton = index == 0
    }
}
