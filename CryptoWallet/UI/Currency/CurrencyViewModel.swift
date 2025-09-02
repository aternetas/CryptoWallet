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
    
    private var name: String = ""
    
    func setCurrency(_ name: String) {
        self.name = name
        
        if let currencyVM = CurrencyService.shared.currencies
            .first(where: { $0.name == name })
            .map({ CurrencyVM(model: $0) }) {
            delegate?.updateData(vm: currencyVM)
        }
        getLastUpdateCurrencyInfo()
    }
    
    private func getLastUpdateCurrencyInfo() {
        CurrencyService.shared.getCurrency(name: name) { [weak self] result in
            switch result {
            case .success(let currency):
                self?.delegate?.updateData(vm: .init(model: currency))
            case .failure(let error):
                self?.showAlert(model: .init(title: "",
                                             message: "Ошибка: \(error.localizedDescription)",
                                             actions: [.init(title: "Понятно",
                                                             style: .default,
                                                             action: { })]))
            }
        }
    }
}
