//
//  SortButton.swift
//  CryptoWallet
//
//  Created by aternetas on 21.07.2025.
//

import UIKit

final class SortButton: UIButton {
    private(set) var isAscending: Bool {
        didSet {
            configuration?.image = isAscending ? .ascendingOrder : .descendingOrder
        }
    }
    
    init(isAscending: Bool) {
        self.isAscending = isAscending
        super.init(frame: .zero)
        
        configureWithImage(isAscending ? .ascendingOrder : .descendingOrder)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func toggle() {
        isAscending = !isAscending
    }
}
