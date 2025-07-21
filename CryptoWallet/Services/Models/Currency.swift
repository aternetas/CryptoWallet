//
//  Currency.swift
//  CryptoWallet
//
//  Created by aternetas on 20.07.2025.
//

import Foundation

struct Currency {
    let id: String
    let name: String
    let symbol: String
    let media: CurrencyMedia
    let priceUSD: Double
    let percentChangeUSDLast24Hours: Double
    let currentCapitalizationUSD: Double
    let currentSupply: Double
    
    init(id: String,
         name: String,
         symbol: String,
         media: CurrencyMedia,
         priceUSD: Double,
         percentChangeUSDLast24Hours: Double,
         currentCapitalizationUSD: Double,
         currentSupply: Double) {
        self.id = id
        self.name = name
        self.symbol = symbol
        self.media = media
        self.priceUSD = priceUSD
        self.percentChangeUSDLast24Hours = percentChangeUSDLast24Hours
        self.currentCapitalizationUSD = currentCapitalizationUSD
        self.currentSupply = currentSupply
    }
    
    init(dto: CurrencyData) {
        self.init(id: dto.id,
                  name: dto.name,
                  symbol: dto.symbol,
                  media: CurrencyMedia.allCases.first { $0.rawValue == dto.name } ?? .other,
                  priceUSD: dto.metrics.marketData.priceUSD,
                  percentChangeUSDLast24Hours: dto.metrics.marketData.percentChangeUSD24H,
                  currentCapitalizationUSD: dto.metrics.marketCapitalization.currentCapitalizationUSD,
                  currentSupply: dto.metrics.circulatingSupply.currentSupply)
    }
}
