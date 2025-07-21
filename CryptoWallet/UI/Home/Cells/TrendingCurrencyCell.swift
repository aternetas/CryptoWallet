//
//  TrendingCurrencyCell.swift
//  CryptoWallet
//
//  Created by aternetas on 16.07.2025.
//

import UIKit
import SnapKit

final class TrendingCurrencyCell: UITableViewCell {
    static let identifier = "TrendingCurrencyCell"
    
    private lazy var icon: UIImageView = .init()
    
    private lazy var iconBackgroundView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 25
        return view
    }()
    
    private lazy var nameLabel: UILabel = .init(font: .medium18,
                                                textColor: .black)
    
    private lazy var symbolLabel: UILabel = .init(font: .medium14,
                                                  textColor: .darkGray)
    
    private lazy var priceUSDLabel: UILabel = .init(font: .medium18,
                                                    textColor: .black)
    
    private lazy var arrowImageView: UIImageView = .init()
    
    private lazy var percentChangeUSDLabel: UILabel = .init(font: .medium14,
                                                            textColor: .darkGray)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupView()
        initConstraints()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func bind(vm: TrendingCurrencyVM) {
        icon.image = vm.media.icon
        iconBackgroundView.backgroundColor = vm.media.backgroundColor
        nameLabel.text = vm.name
        symbolLabel.text = vm.symbol
        priceUSDLabel.text = "$\(vm.priceUSD)"
        percentChangeUSDLabel.text = "\(vm.percentChangeUSDLast24Hours.formatted2)"
        arrowImageView.image = vm.percentChangeUSDLast24Hours > 0.0 ? .arrowUp : .arrowDown
    }
    
    func setupView() {
        selectionStyle = .none
        backgroundColor = .clear
    }
    
    func initConstraints() {
        addSubviews([iconBackgroundView,
                     nameLabel,
                     symbolLabel,
                     priceUSDLabel,
                     percentChangeUSDLabel,
                     arrowImageView])
        
        iconBackgroundView.addSubview(icon)
        
        icon.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.height.width.equalTo(24)
        }
        
        iconBackgroundView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10)
            make.leading.equalToSuperview().offset(25)
            make.bottom.equalToSuperview().inset(20)
            make.height.width.equalTo(50)
        }
        
        nameLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10)
            make.leading.equalTo(iconBackgroundView.snp.trailing).offset(19)
        }
        
        symbolLabel.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom).offset(3)
            make.leading.equalTo(iconBackgroundView.snp.trailing).offset(19)
        }
        
        priceUSDLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10)
            make.trailing.equalToSuperview().inset(25)
        }
        
        percentChangeUSDLabel.snp.makeConstraints { make in
            make.top.equalTo(priceUSDLabel.snp.bottom).offset(3)
            make.trailing.equalToSuperview().inset(25)
        }
        
        arrowImageView.snp.makeConstraints { make in
            make.trailing.equalTo(percentChangeUSDLabel.snp.leading).offset(-5)
            make.centerY.equalTo(percentChangeUSDLabel.snp.centerY)
            make.height.width.equalTo(12)
        }
    }
}
