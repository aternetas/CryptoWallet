//
//  CirculatingSupply.swift
//  CryptoWallet
//
//  Created by aternetas on 21.07.2025.
//

import Foundation

struct CirculatingSupply: Codable {
    let currentSupply: Double
    
    enum CodingKeys: String, CodingKey {
        case currentSupply = "circulating"
    }
}
