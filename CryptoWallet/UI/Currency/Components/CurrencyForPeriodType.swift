//
//  CurrencyForPeriodType.swift
//  CryptoWallet
//
//  Created by aternetas on 21.07.2025.
//

import Foundation

enum CurrencyForPeriodType: CustomSegmentedControlButtonProtocol, CaseIterable {
    case day, week, year, all, point
    
    var index: Int {
        switch self {
        case .day:
            0
        case .week:
            1
        case .year:
            2
        case .all:
            3
        case .point:
            4
        }
    }
    
    var title: String {
        switch self {
        case .day:
            "24H"
        case .week:
            "1W"
        case .year:
            "1Y"
        case .all:
            "ALL"
        case .point:
            "Point"
        }
    }
}
