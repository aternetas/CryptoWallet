//
//  LoginView.swift
//  CryptoWallet
//
//  Created by aternetas on 17.07.2025.
//

import UIKit
import SnapKit

final class LoginView: BaseView, BaseViewProtocol {
    private lazy var robotImageView: UIImageView = .init(image: .robot)
    
    lazy var usernameTextField: LoginTextField = .init(type: .username)
    
    lazy var passwordTextField: LoginTextField = .init(type: .password)
    
    lazy var loginButton: UIButton = .init(text: "Login",
                                           textColor: .white,
                                           font: .semibold15,
                                           backgroundColor: .black,
                                           cornerRadius: 40)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
        initConstraints()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        backgroundColor = .lightGray
    }
    
    func initConstraints() {
        addSubviews([robotImageView,
                     usernameTextField,
                     passwordTextField,
                     loginButton])
        
        robotImageView.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide).offset(13)
            make.centerX.equalToSuperview()
            make.height.width.equalTo(287)
        }
        
        usernameTextField.snp.makeConstraints { make in
            make.height.equalTo(55)
            make.leading.trailing.equalToSuperview().inset(25)
            make.bottom.equalTo(passwordTextField.snp.top).offset(-15)
        }
        
        passwordTextField.snp.makeConstraints { make in
            make.height.equalTo(55)
            make.leading.trailing.equalToSuperview().inset(25)
            make.bottom.equalTo(loginButton.snp.top).offset(-25)
        }
        
        loginButton.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(25)
            make.bottom.equalToSuperview().inset(133)
            make.height.equalTo(55)
        }
    }
}
