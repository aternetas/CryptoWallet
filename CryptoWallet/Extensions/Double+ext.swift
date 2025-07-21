//
//  Double+ext.swift
//  CryptoWallet
//
//  Created by aternetas on 21.07.2025.
//

import Foundation

extension Double {
    var formatted: String {
        if self == 0 {
            return "0"
        }
        
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 2
        formatter.minimumFractionDigits = 2
        
        return formatter.string(from: .init(value: Double(Int(self * 100)) / 100.0)) ?? String(format: "%.2f", self)
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
