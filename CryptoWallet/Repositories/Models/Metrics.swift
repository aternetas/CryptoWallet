//
//  Metrics.swift
//  CryptoWallet
//
//  Created by aternetas on 17.07.2025.
//

import Foundation

struct Metrics: Codable {
    let marketData: MarketData
    let marketCapitalization: MarketCapitalization
    let circulatingSupply: CirculatingSupply
    
    enum CodingKeys: String, CodingKey {
        case marketData = "market_data",
             marketCapitalization = "marketcap",
             circulatingSupply = "supply"
    }
}
