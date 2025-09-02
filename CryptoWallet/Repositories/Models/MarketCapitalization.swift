//
//  MarketCapitalization.swift
//  CryptoWallet
//
//  Created by aternetas on 21.07.2025.
//

import Foundation

struct MarketCapitalization: Codable {
    let currentCapitalizationUSD: Double
    
    enum CodingKeys: String, CodingKey {
        case currentCapitalizationUSD = "current_marketcap_usd"
    }
}
