//
//  CurrencyServiceProtocol.swift
//  CryptoWallet
//
//  Created by aternteas on 25.07.2025.
//

import Foundation

protocol CurrencyServiceProtocol {
    func getCurrencies(names: Set<String>, completionHandler: @escaping (Result<[Currency], Error>) -> Void)
    func getCurrency(name: String, completionHandler: @escaping (Result<Currency, Error>) -> Void)
}
