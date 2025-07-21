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
    
    func setCurrency(_ id: String) {
        if let currencyVM = CurrencyService.shared.currencies
            .first(where: { $0.id == id })
            .map({ CurrencyVM(model: $0) }) {
            delegate?.updateData(vm: currencyVM)
        }
    }
}
