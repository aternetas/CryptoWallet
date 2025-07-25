//
//  HomeViewModel.swift
//  CryptoWallet
//
//  Created by aternetas on 12.07.2025.
//

import Foundation

protocol HomeViewModelDelegate: AnyObject {
    func getData()
    func changeMenuVisibility()
    func updateData()
    func logOut()
}

final class HomeViewModel: BaseViewModel {
    weak var delegate: HomeViewModelDelegate?
    
    private(set) var currenciesVM: [Currency] = []
    
    func getData() {
        DispatchQueue.global(qos: .userInitiated).async {
            CurrencyService.shared.getCurrencies { [weak self] result in
                switch result {
                case .success(let currencies):
                    self?.currenciesVM = currencies
                    self?.delegate?.getData()
                case .failure(_):
                    //alert
                    return
                }
            }
        }
    }
    
    func refreshData(isAscending: Bool) {
        currenciesVM.removeAll()
        delegate?.updateData()
        getData()
    }
    
    func sort(isAscending: Bool) {
        sortCurrencies(isAscending: isAscending)
        delegate?.updateData()
    }
    
    func changeMenuVisibility() {
        delegate?.changeMenuVisibility()
    }
    
    func selectCurrency(_ id: String) {
        navigationManager?.openScreen(screen: .currency(id))
    }
    
    func logOut() {
        UserDefaultsService.shared.setNewValue(value: false, key: .IS_AUTORIZED)
        delegate?.logOut()
    }
    
    private func sortCurrencies(isAscending: Bool) {
        currenciesVM.sort { isAscending ?
            $0.percentChangeUSDLast24Hours < $1.percentChangeUSDLast24Hours :
            $0.percentChangeUSDLast24Hours > $1.percentChangeUSDLast24Hours }
    }
}
