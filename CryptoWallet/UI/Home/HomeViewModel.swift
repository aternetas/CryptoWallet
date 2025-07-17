//
//  HomeViewModel.swift
//  CryptoWallet
//
//  Created by aternetas on 12.07.2025.
//

import Foundation

protocol HomeViewModelDelegate: AnyObject {
    func changeMenuVisibility()
}

final class HomeViewModel: BaseViewModel {
    weak var delegate: HomeViewModelDelegate?
    
    func changeMenuVisibility() {
        delegate?.changeMenuVisibility()
    }
}
