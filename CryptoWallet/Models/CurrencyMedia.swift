//
//  CurrencyMedia.swift
//  CryptoWallet
//
//  Created by aternetas on 16.07.2025.
//

import UIKit

enum CurrencyMedia: String {
    case btc = "Bitcoin",
         eth = "Ethereum",
         tron = "TRON",
         dogecoin = "Dogecoin",
         tether = "Tether",
         stellar = "Stellar",
         cardano = "Cardano",
         xrp = "XRP"
    
    var icon: UIImage {
        switch self {
        case .btc:
            UIImage(resource: .bitcoin)
        case .eth:
            UIImage(resource: .ethereum)
        case .tron:
            UIImage(resource: .TRON)
        case .dogecoin:
            UIImage(resource: .dogecoin)
        case .tether:
            UIImage(resource: .tether)
        case .stellar:
            UIImage(resource: .stellar)
        case .cardano:
            UIImage(resource: .cardano)
        case .xrp:
            UIImage(resource: .XRP)
        }
    }
    
    var backgroundColor: UIColor {
        switch self {
        case .btc:
            UIColor(resource: .bitcoinBackground)
        case .eth:
            UIColor(resource: .ethereumBackground)
        case .tron:
            UIColor(resource: .tronBackground)
        case .dogecoin:
            UIColor(resource: .dogecoinBackground)
        case .tether:
            UIColor(resource: .tetherBackround)
        case .stellar:
            UIColor(resource: .stellarBackground)
        case .cardano:
            UIColor(resource: .cardanoBackground)
        case .xrp:
            UIColor(resource: .xrpBackground)
        }
    }
}
