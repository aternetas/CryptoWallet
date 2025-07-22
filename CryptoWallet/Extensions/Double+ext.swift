//
//  Double+ext.swift
//  CryptoWallet
//
//  Created by aternetas on 21.07.2025.
//

import Foundation

fileprivate var currencyFormatter: NumberFormatter = {
    let formatter = NumberFormatter()
    formatter.numberStyle = .currency
    formatter.locale = Locale(identifier: "en_US")
    formatter.maximumFractionDigits = 2
    formatter.minimumFractionDigits = 2
    return formatter
}()

fileprivate var capitalizationFormatter: NumberFormatter = {
    let formatter = NumberFormatter()
    formatter.numberStyle = .currency
    formatter.locale = Locale(identifier: "en_US")
    formatter.maximumFractionDigits = 0
    return formatter
}()

fileprivate var supplyFormatter: NumberFormatter = {
    let formatter = NumberFormatter()
    formatter.numberStyle = .decimal
    formatter.maximumFractionDigits = 0
    formatter.groupingSeparator = "."
    formatter.usesGroupingSeparator = true
    return formatter
}()

extension Double {
    var currencyFormatted: String {
        currencyFormatter.string(from: NSNumber(value: self)) ?? twoDigitsAfterComma
    }
    
    var capitalizationFormatted: String {
        capitalizationFormatter.string(from: NSNumber(value: self)) ?? "\(Int(self))"
    }
    
    var supplyFormatted: String {
        supplyFormatter.string(from: NSNumber(value: self)) ?? "\(Int(self))"
    }
    
    var oneDigitAfterComma: String {
        if self == 0 {
            return "0"
        }
        
        return String(format: "%.1f", self)
    }
    
    var twoDigitsAfterComma: String {
        if self == 0 {
            return "0"
        }
        
        return String(format: "%.2f", self)
    }
}
