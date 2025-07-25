//
//  CurrencyServiceProtocol.swift
//  CryptoWallet
//
//  Created by aternteas on 25.07.2025.
//

import Foundation

protocol CurrencyServiceProtocol {
    func getData(completionHandler: @escaping (Result<[Currency], Error>) -> Void)
}
