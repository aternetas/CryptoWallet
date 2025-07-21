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
    
    private(set) lazy var customSegmentedControl: CustomSegmentedControl = .init(buttons: CurrencyForPeriodType
        .allCases
        .map { CustomSegmentedControlButton(button: $0)} )
    
    private lazy var cardView: CardView = .init(backgroundColor: .white.withAlphaComponent(0.8))
    
    private lazy var marketStatisticsLabel: UILabel = .init(text: "Market Statistics",
                                                            font: .medium20,
                                                            textColor: .black)
    
    private lazy var marketCapitalizationLabel: UILabel = .init(text: "Market capitalization",
                                                             font: .medium14,
                                                             textColor: .darkGray)
    
    private lazy var marketCapitalizationValueLabel: UILabel = .init(font: .semibold14,
                                                                     textColor: .black)
    
    private lazy var circulatingSupplyLabel: UILabel = .init(text: "Circulating Supply",
                                                             font: .medium14,
                                                             textColor: .darkGray)
    
    private lazy var circulatingSupplyValueLabel: UILabel = .init(font: .semibold14,
                                                                     textColor: .black)
    
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
        marketCapitalizationValueLabel.text = vm.marketCapitalization
        circulatingSupplyValueLabel.text = vm.circulatingSupply
    }
    
    func setupView() {
        backgroundColor = .lightGray
    }
    
    func initConstraints() {
        addSubviews([backButton,
                     currencyLabel,
                     priceUSDLabel,
                     percentChangeAndArrowView,
                     customSegmentedControl,
                     cardView])
        
        percentChangeAndArrowView.addSubviews([arrowImageView,
                                               percentChangeUSDLabel])
        
        cardView.addSubviews([marketStatisticsLabel,
                              marketCapitalizationLabel,
                              marketCapitalizationValueLabel,
                              circulatingSupplyLabel,
                              circulatingSupplyValueLabel])
        
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
        
        customSegmentedControl.snp.makeConstraints { make in
            make.top.equalTo(arrowImageView.snp.bottom).offset(20)
            make.leading.trailing.equalToSuperview().inset(25)
            make.height.equalTo(56)
        }
        
        cardView.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalToSuperview()
        }
        
        marketStatisticsLabel.snp.makeConstraints { make in
            make.top.leading.equalToSuperview().offset(25)
            make.bottom.equalTo(marketCapitalizationLabel.snp.top).offset(-15)
        }
        
        marketCapitalizationLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(25)
            make.bottom.equalTo(circulatingSupplyLabel.snp.top).offset(-15)
        }
        
        marketCapitalizationValueLabel.snp.makeConstraints { make in
            make.trailing.equalToSuperview().offset(-25)
            make.centerY.equalTo(marketCapitalizationLabel)
        }
        
        circulatingSupplyLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(25)
            make.bottom.equalToSuperview().inset(115)
        }
        
        circulatingSupplyValueLabel.snp.makeConstraints { make in
            make.trailing.equalToSuperview().offset(-25)
            make.centerY.equalTo(circulatingSupplyLabel)
        }
    }
}
