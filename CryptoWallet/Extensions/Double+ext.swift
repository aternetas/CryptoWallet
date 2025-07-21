//
//  Double+ext.swift
//  CryptoWallet
//
//  Created by aternetas on 21.07.2025.
//

import Foundation

extension Double {
    var currencyFormatted: String {
        if self == 0 {
            return "0"
        }
        
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.locale = Locale(identifier: "en_US")
        formatter.maximumFractionDigits = 2
        formatter.minimumFractionDigits = 2
        
        return formatter.string(from: NSNumber(value: self)) ?? twoDigitsAfterComma
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
