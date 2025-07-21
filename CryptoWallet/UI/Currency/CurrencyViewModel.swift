//
//  CurrencyViewModel.swift
//  CryptoWallet
//
//  Created by aternetas on 21.07.2025.
//

import Foundation

final class CurrencyViewModel: BaseViewModel {
    private(set) var currencyId: String = ""
    
    func setCurrency(_ id: String) {
        currencyId = id
    }
}
