//
//  MenuView.swift
//  CryptoWallet
//
//  Created by aternetas on 17.07.2025.
//

import UIKit
import SnapKit

enum MenuType {
    case refresh, exit
    
    var image: UIImage {
        switch self {
        case .refresh:
                .rocket
        case .exit:
                .trash
        }
    }
    
    var text: String {
        switch self {
        case .refresh:
            "Обновить"
        case .exit:
            "Выйти"
        }
    }
}

protocol MenuViewDelegateProtocol: AnyObject {
    func tapOnMenuCell(_ type: MenuType)
}

final class MenuView: BaseView, BaseViewProtocol {
    weak var delegate: MenuViewDelegateProtocol?
    
    private let menuCells: [MenuViewCell] = [MenuViewCell(.refresh),
                                             MenuViewCell(.exit)]
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 16.0
        stackView.isUserInteractionEnabled = true
        
        menuCells.forEach { $0.delegate = self }
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

extension MenuView: MenuViewCellListenerProtocol {
    func tapOnCell(_ type: MenuType) {
        delegate?.tapOnMenuCell(type)
    }
}
