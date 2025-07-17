//
//  LoginViewController.swift
//  CryptoWallet
//
//  Created by aternetas on 17.07.2025.
//

import Foundation

final class LoginViewController: BaseViewController<LoginViewModel, LoginView> {
    override init() {
        super.init()
        
        viewModel = LoginViewModel()
        viewModel.delegate = self
        rootView = LoginView()
    }
    
    @MainActor required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        
        view = rootView
    }
}

extension LoginViewController: LoginViewModelDelegate {
    
}
