//
//  MenuViewCell.swift
//  CryptoWallet
//
//  Created by aternetas on 17.07.2025.
//

import UIKit

final class MenuViewCell: BaseView, BaseViewProtocol {
    private lazy var iconImageView: UIImageView = .init()
    
    private lazy var menuLabel: UILabel = .init(font: .medium18,
                                                textColor: .black)
    
    private let image: UIImage
    private let text: String
    
    init(image: UIImage, text: String) {
        self.image = image
        self.text = text
        
        super.init(frame: .zero)
        
        setupView()
        initConstraints()
    }
    
    @MainActor required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        iconImageView.image = image
        menuLabel.text = text
        
        backgroundColor = .clear
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
