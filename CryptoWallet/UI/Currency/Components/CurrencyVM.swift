//
//  CurrencyVM.swift
//  CryptoWallet
//
//  Created by aternetas on 21.07.2025.
//

import Foundation

struct CurrencyVM {
    let id: String
    let nameWithSymbol: String
    let priceUSD: String
    let percentChangeUSDLast24Hours: Double
    let marketCapitalization: String
    let circulatingSupply: String
    
    init(id: String,
         nameWithSymbol: String,
         priceUSD: String,
         percentChangeUSDLast24Hours: Double,
         marketCapitalization: String,
         circulatingSupply: String) {
        self.id = id
        self.nameWithSymbol = nameWithSymbol
        self.priceUSD = priceUSD
        self.percentChangeUSDLast24Hours = percentChangeUSDLast24Hours
        self.marketCapitalization = marketCapitalization
        self.circulatingSupply = circulatingSupply
    }
    
    init(model: Currency) {
        id = model.id
        nameWithSymbol = "\(model.name) (\(model.symbol))"
        priceUSD = model.priceUSD.currencyFormatted
        percentChangeUSDLast24Hours = model.percentChangeUSDLast24Hours
        marketCapitalization = model.currentCapitalizationUSD.capitalizationFormatted
        circulatingSupply = "\(model.currentSupply.supplyFormatted) \(model.symbol)"
    }
}
