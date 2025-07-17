//
//  LoginViewModel.swift
//  CryptoWallet
//
//  Created by aternetas on 17.07.2025.
//

import Foundation

protocol LoginViewModelDelegate: AnyObject {
}

final class LoginViewModel: BaseViewModel {
    weak var delegate: LoginViewModelDelegate?
}
