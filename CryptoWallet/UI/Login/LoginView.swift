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
                     passwordTextField])
        
        robotImageView.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide).offset(13)
            make.centerX.equalToSuperview()
            make.height.width.equalTo(287)
        }
        
        usernameTextField.snp.makeConstraints { make in
            make.top.equalTo(robotImageView.snp.bottom).offset(174)
            make.height.equalTo(55)
            make.leading.trailing.equalToSuperview().inset(25)
        }
        
        passwordTextField.snp.makeConstraints { make in
            make.top.equalTo(usernameTextField.snp.bottom).offset(15)
            make.height.equalTo(55)
            make.leading.trailing.equalToSuperview().inset(25)
        }
    }
}
