//
//  CurrenciesResponse.swift
//  CryptoWallet
//
//  Created by aternetas on 17.07.2025.
//

import Foundation

//MARK: - top-level response
struct CurrenciesResponse: Codable {
    let data: [CurrencyData]
}
