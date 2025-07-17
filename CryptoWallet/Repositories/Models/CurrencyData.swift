//
//  CurrencyData.swift
//  CryptoWallet
//
//  Created by f f on 17.07.2025.
//

import Foundation

struct CurrencyData: Codable {
    let id: String
    let symbol: String
    let name: String
    let metrics: Metrics
}
