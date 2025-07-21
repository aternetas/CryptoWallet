//
//  HomeViewModel.swift
//  CryptoWallet
//
//  Created by aternetas on 12.07.2025.
//

import Foundation

protocol HomeViewModelDelegate: AnyObject {
    func changeMenuVisibility()
    func updateData()
    func logOut()
}

final class HomeViewModel: BaseViewModel {
    weak var delegate: HomeViewModelDelegate?
    
    private(set) var currenciesVM: [Currency] = []
    
    func getData() {
        CurrencyService.shared.getData { [weak self] result in
            switch result {
            case .success(let currencies):
                self?.currenciesVM = currencies
                self?.delegate?.updateData()
            case .failure(let failure):
                //alert
                return
            }
        }
    }
    
    func refreshData() {
        
    }
    
    func changeMenuVisibility() {
        delegate?.changeMenuVisibility()
    }
    
    func logOut() {
        UserDefaultsService.shared.setNewValue(value: false, key: .IS_AUTORIZED)
        delegate?.logOut()
    }
}
