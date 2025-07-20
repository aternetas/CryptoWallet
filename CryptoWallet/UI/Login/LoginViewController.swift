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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addButtonActions()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    private func addButtonActions() {
        rootView.loginButton.addAction(UIAction { [weak self] _ in
            guard let self else { return }
            viewModel.login(username: rootView.usernameTextField.text,
                                 password: rootView.passwordTextField.text)
        }, for: .touchUpInside)
    }
}

extension LoginViewController: LoginViewModelDelegate {
    
}
