//
//  CurrencyView.swift
//  CryptoWallet
//
//  Created by aternetas on 21.07.2025.
//

import UIKit
import SnapKit

final class CurrencyView: BaseView, BaseViewProtocol {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
        initConstraints()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
    }
    
    func initConstraints() {
    }
}
