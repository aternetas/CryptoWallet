//
//  CurrencyView.swift
//  CryptoWallet
//
//  Created by aternetas on 21.07.2025.
//

import UIKit
import SnapKit

final class CurrencyView: BaseView, BaseViewProtocol {
    private(set) lazy var backButton: UIButton = .init(image: .arrowBack,
                                                       backgroundColor: .white)
    
    private lazy var currencyLabel: UILabel = .init(font: .medium14,
                                                    textColor: .black)
    
    private lazy var priceUSDLabel: UILabel = .init(font: .medium28,
                                                    textColor: .black)
    
    private lazy var arrowImageView: UIImageView = .init()
    
    private lazy var percentChangeUSDLabel: UILabel = .init(font: .medium14,
                                                            textColor: .darkGray)
    
    private lazy var percentChangeAndArrowView: UIView = .init()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
        initConstraints()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func bind(vm: CurrencyVM) {
        currencyLabel.text = vm.nameWithSymbol
        priceUSDLabel.text = vm.priceUSD
        arrowImageView.image = vm.percentChangeUSDLast24Hours > 0 ? .arrowUp : .arrowDown
        percentChangeUSDLabel.text = vm.percentChangeUSDLast24Hours.oneDigitAfterComma
    }
    
    func setupView() {
        backgroundColor = .lightGray
    }
    
    func initConstraints() {
        percentChangeAndArrowView.addSubviews([arrowImageView,
                                               percentChangeUSDLabel])
        
        addSubviews([backButton,
                     currencyLabel,
                     priceUSDLabel,
                     percentChangeAndArrowView])
        
        backButton.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide).offset(10)
            make.leading.equalToSuperview().offset(25)
            make.height.width.equalTo(48)
        }
        
        currencyLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalTo(backButton)
        }
        
        priceUSDLabel.snp.makeConstraints { make in
            make.top.equalTo(currencyLabel.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
        }
        
        percentChangeAndArrowView.snp.makeConstraints { make in
            make.top.equalTo(priceUSDLabel.snp.bottom)
            make.centerX.equalToSuperview()
        }
        
        percentChangeUSDLabel.snp.makeConstraints { make in
            make.top.trailing.bottom.equalToSuperview()
        }
        
        arrowImageView.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.trailing.equalTo(percentChangeUSDLabel.snp.leading).offset(-5)
            make.centerY.equalTo(percentChangeUSDLabel)
        }
    }
}
