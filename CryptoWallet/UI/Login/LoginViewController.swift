//
//  LoginViewController.swift
//  CryptoWallet
//
//  Created by aternetas on 17.07.2025.
//

import UIKit

final class LoginViewController: BaseViewController<LoginViewModel, LoginView> {
    override init() {
        super.init()
        
        viewModel = LoginViewModel()
        viewModel.delegate = self
        
        rootView = LoginView()
    }
    
    @available(*, unavailable)
    @MainActor required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        
        view = rootView
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
}

extension LoginViewController: LoginViewModelDelegate {
    
}
