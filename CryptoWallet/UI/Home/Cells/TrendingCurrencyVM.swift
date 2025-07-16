//
//  TrendingCurrencyVM.swift
//  CryptoWallet
//
//  Created by aternetas on 16.07.2025.
//

import UIKit

protocol TrendingCurrencyCellListenerProtocol {
    func selectCurrency(id: String)
}

final class TrendingCurrencyVM {
    let id: String
    let name: String
    let symbol: String
    let priceUSD: Double
    let media: CurrencyMedia
    let percentChangeUSDLast24Hours: Double
    let delegate: TrendingCurrencyCellListenerProtocol?
    
    init(id: String,
         name: String,
         symbol: String,
         priceUSD: Double,
         media: CurrencyMedia,
         percentChangeUSDLast24Hours: Double,
         delegate: TrendingCurrencyCellListenerProtocol?) {
        self.id = id
        self.name = name
        self.symbol = symbol
        self.priceUSD = priceUSD
        self.media = media
        self.percentChangeUSDLast24Hours = percentChangeUSDLast24Hours
        self.delegate = delegate
    }
}
