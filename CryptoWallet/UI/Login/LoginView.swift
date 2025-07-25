//
//  LoginView.swift
//  CryptoWallet
//
//  Created by aternetas on 17.07.2025.
//

import UIKit
import SnapKit

final class LoginView: BaseView, BaseViewProtocol {
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsVerticalScrollIndicator = false
        scrollView.isScrollEnabled = true
        return scrollView
    }()
    
    private lazy var contentView: UIView = .init()
    
    private lazy var robotImageView: UIImageView = .init(image: .robot)
    
    private(set) lazy var usernameTextField: LoginTextField = .init(type: .username)
    
    private(set) lazy var passwordTextField: LoginTextField = .init(type: .password)
    
    private(set) lazy var loginButton: UIButton = .init(text: "Login",
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
    
    func updateContentInsets(rect: CGRect, isShow: Bool) {
        scrollView.contentInset.bottom = isShow ? rect.height + CGFloat(110.0) : 0.0
    }
    
    func setupView() {
        backgroundColor = .lightGray
    }
    
    func initConstraints() {
        addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        contentView.addSubviews([robotImageView,
                                usernameTextField,
                                passwordTextField,
                                loginButton])
        
        scrollView.snp.makeConstraints { make in
            make.top.leading.trailing.bottom.height.width.equalTo(safeAreaLayoutGuide)
        }
        
        contentView.snp.makeConstraints { make in
            make.top.leading.trailing.bottom.equalTo(scrollView.contentLayoutGuide)
            make.height.equalTo(scrollView.frameLayoutGuide)
            make.width.equalTo(scrollView.frameLayoutGuide).priority(300)
        }
        
        robotImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(13)
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
