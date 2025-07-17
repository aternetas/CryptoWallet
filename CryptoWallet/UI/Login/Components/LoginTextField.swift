//
//  LoginTextField.swift
//  CryptoWallet
//
//  Created by aternetas on 17.07.2025.
//

import UIKit

enum LoginTextFieldType {
    case username, password
    
    var placeholder: String {
        switch self {
        case .username:
            "Username"
        case .password:
            "Password"
        }
    }
    
    var image: UIImage {
        switch self {
        case .username:
                .user
        case .password:
                .password
        }
    }
}

final class LoginTextField: UITextField, BaseViewProtocol {
    private let type: LoginTextFieldType
    
    private let insets: UIEdgeInsets = .init(top: 0, left: 62, bottom: 0, right: 20)
    
    init(type: LoginTextFieldType) {
        self.type = type
        super.init(frame: .zero)
        
        setupView()
        initConstraints()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
//        bounds.inset(by: insets)
//    }
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        bounds.inset(by: insets)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        bounds.inset(by: insets)
    }
    
    func setupView() {
        layer.cornerRadius = 25
        layer.backgroundColor = UIColor(resource: .white).withAlphaComponent(0.8).cgColor
        
        textColor = .darkGray
        font = .regular15
        
        attributedPlaceholder = NSAttributedString(string: type.placeholder,
                                                   attributes: [NSAttributedString.Key.foregroundColor : UIColor.darkGray])
    }
    
    func initConstraints() {
        
    }
}
