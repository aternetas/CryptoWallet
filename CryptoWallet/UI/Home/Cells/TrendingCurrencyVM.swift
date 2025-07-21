//
//  TrendingCurrencyVM.swift
//  CryptoWallet
//
//  Created by aternetas on 16.07.2025.
//

import UIKit

final class TrendingCurrencyVM {
    let id: String
    let name: String
    let symbol: String
    let priceUSD: String
    let media: CurrencyMedia
    let percentChangeUSDLast24Hours: Double
    
    init(id: String,
         name: String,
         symbol: String,
         priceUSD: Double,
         media: CurrencyMedia,
         percentChangeUSDLast24Hours: Double) {
        self.id = id
        self.name = name
        self.symbol = symbol
        self.priceUSD = "\(priceUSD.formatted)"
        self.media = media
        self.percentChangeUSDLast24Hours = percentChangeUSDLast24Hours
    }
    
    convenience init(model: Currency) {
        self.init(id: model.id,
                  name: model.name,
                  symbol: model.symbol,
                  priceUSD: model.priceUSD,
                  media: model.media,
                  percentChangeUSDLast24Hours: model.percentChangeUSDLast24Hours)
    }
}
