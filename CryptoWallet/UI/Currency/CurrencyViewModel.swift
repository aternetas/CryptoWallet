//
//  CurrencyViewModel.swift
//  CryptoWallet
//
//  Created by aternetas on 21.07.2025.
//

import Foundation

protocol CurrencyViewModelDelegate: AnyObject {
    func updateData(vm: CurrencyVM)
}

final class CurrencyViewModel: BaseViewModel {
    weak var delegate: CurrencyViewModelDelegate?
    
    private(set) var currencyId: String = ""
    
    func setCurrency(_ id: String) {
        currencyId = id
    }
}
