//
//  MenuViewCell.swift
//  CryptoWallet
//
//  Created by aternetas on 17.07.2025.
//

import UIKit

protocol MenuViewCellListenerProtocol: AnyObject {
    func tapOnCell(_ type: MenuType)
}

final class MenuViewCell: BaseView, BaseViewProtocol {
    weak var delegate: MenuViewCellListenerProtocol?
    
    private lazy var iconImageView: UIImageView = .init()
    
    private lazy var menuLabel: UILabel = .init(font: .medium18,
                                                textColor: .black)
    
    private let type: MenuType
    
    init(_ type: MenuType) {
        self.type = type

        super.init(frame: .zero)
        
        setupView()
        initConstraints()
    }
    
    @available(*, unavailable)
    @MainActor required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        backgroundColor = .clear
        
        iconImageView.image = type.image
        menuLabel.text = type.text
        
        addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapOnCell)))
    }
    
    @objc func tapOnCell() {
        delegate?.tapOnCell(type)
    }
    
    func initConstraints() {
        addSubviews([menuLabel,
                     iconImageView])

        iconImageView.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview().inset(3.5)
            make.leading.equalToSuperview()
            make.height.width.equalTo(20)
        }
        
        menuLabel.snp.makeConstraints { make in
            make.top.trailing.equalToSuperview()
            make.leading.equalTo(iconImageView.snp.trailing).offset(8)
        }
    }
}
