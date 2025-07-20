//
//  HomeViewModel.swift
//  CryptoWallet
//
//  Created by aternetas on 12.07.2025.
//

import Foundation

protocol HomeViewModelDelegate: AnyObject {
    func changeMenuVisibility()
    func logOut()
}

final class HomeViewModel: BaseViewModel {
    weak var delegate: HomeViewModelDelegate?
    
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
