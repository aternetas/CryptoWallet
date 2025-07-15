//
//  HomeView.swift
//  CryptoWallet
//
//  Created by aternetas on 12.07.2025.
//

import UIKit
import SnapKit

final class HomeView: BaseView, BaseViewProtocol {
    private lazy var homeLabel: UILabel = .init(text: "Home",
                                                font: .semibold32,
                                                textColor: .white)
    
    private lazy var affiliateProgramLabel: UILabel = .init(text: "Affiliate program",
                                                            font: .medium20,
                                                            textColor: .white)
    
    private lazy var learnMoreButton: UIButton = .init(text: "Learn more",
                                                       textColor: .black,
                                                       font: .semibold14,
                                                       backgroundColor: .white,
                                                       cornerRadius: 40.0)
    
    private lazy var menuButton: UIButton = .init(image: .dots)
    
    private lazy var stackImageView: UIImageView = .init(image: .stack)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
        initConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        backgroundColor = .pink
    }
    
    func initConstraints() {
        addSubviews([homeLabel,
                     affiliateProgramLabel,
                     learnMoreButton,
                     menuButton,
                     stackImageView])
        
        
        homeLabel.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide).offset(10)
            make.leading.equalToSuperview().offset(25)
        }
        
        affiliateProgramLabel.snp.makeConstraints { make in
            make.top.equalTo(homeLabel.snp.bottom).offset(46)
            make.leading.equalToSuperview().offset(25)
        }
        
        learnMoreButton.snp.makeConstraints { make in
            make.top.equalTo(affiliateProgramLabel.snp.bottom).offset(12)
            make.leading.equalToSuperview().offset(25)
            make.height.equalTo(35)
        }
        
        menuButton.snp.makeConstraints { make in
            make.trailing.equalToSuperview().inset(25)
            make.centerY.equalTo(homeLabel.snp.centerY)
            make.height.width.equalTo(48)
        }
        
        stackImageView.snp.makeConstraints { make in
            make.top.equalTo(menuButton.snp.bottom).offset(21)
            make.trailing.equalToSuperview().inset(-56)
            make.height.width.equalTo(242)
        }
    }
}
