//
//  MenuView.swift
//  CryptoWallet
//
//  Created by aternetas on 17.07.2025.
//

import UIKit
import SnapKit

final class MenuView: BaseView, BaseViewProtocol {
    private let menuCells: [MenuViewCell] = [MenuViewCell(image: .rocket, text: "Обновить"),
                                             MenuViewCell(image: .trash, text: "Выйти")]
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 16.0
        
        stackView.addArrangedSubviews(menuCells)
        
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
        initConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        backgroundColor = .white
        layer.cornerRadius = 16
    }
    
    func initConstraints() {
        addSubview(stackView)
        
        stackView.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview().inset(16)
            make.leading.trailing.equalToSuperview().inset(20)
        }
    }
}
