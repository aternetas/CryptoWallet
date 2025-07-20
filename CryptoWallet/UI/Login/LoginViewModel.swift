//
//  LoginViewModel.swift
//  CryptoWallet
//
//  Created by aternetas on 17.07.2025.
//

import Foundation

protocol LoginViewModelDelegate: AnyObject {
    func login()
    func refreshTextFields()
}

final class LoginViewModel: BaseViewModel {
    weak var delegate: LoginViewModelDelegate?
    
    func login(username: String?, password: String?) {
        if checkUserInput(username: username, password: password) {
            delegate?.login()
        } else {
            showAlert(model: .init(title: "",
                                   message: "Введены неправильно логин или пароль",
                                   actions: [.init(title: "Отменить",
                                                   style: .destructive,
                                                   action: { [weak self] in self?.delegate?.refreshTextFields() }),
                                             .init(title: "Повторить",
                                                   style: .default,
                                                   action: { })]))
        }
    }
    
    private func checkUserInput(username: String?, password: String?) -> Bool {
        username == "1234" && password == "1234"
    }
}
