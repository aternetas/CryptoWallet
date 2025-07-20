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
    
    func login(username: String?, password: String?) {
        if checkUserInput(username: username, password: password) {
            
        } else {
            
        }
    }
    
    private func checkUserInput(username: String?, password: String?) -> Bool {
        username == "1234" && password == "1234"
    }
}
