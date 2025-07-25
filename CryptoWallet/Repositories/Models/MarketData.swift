//
//  MarketData.swift
//  CryptoWallet
//
//  Created by aternetas on 17.07.2025.
//

import Foundation

struct MarketData: Codable {
    let priceUSD: Double
    let percentChangeUSD24H: Double
    
    enum CodingKeys: String, CodingKey {
        case priceUSD = "price_usd",
             percentChangeUSD24H = "percent_change_usd_last_24_hours"
    }
}
