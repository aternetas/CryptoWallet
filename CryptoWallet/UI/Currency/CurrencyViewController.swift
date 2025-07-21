//
//  CurrencyViewController.swift
//  CryptoWallet
//
//  Created by aternetas on 21.07.2025.
//

import UIKit

final class CurrencyViewController: BaseViewController<CurrencyViewModel, CurrencyView> {
    override init() {
        super.init()
        
        viewModel = CurrencyViewModel()
    }
    
    @available(*, unavailable)
    @MainActor required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
