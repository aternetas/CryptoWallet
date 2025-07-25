//
//  CurrencyRepositoryProtocol.swift
//  CryptoWallet
//
//  Created by aternetas on 25.07.2025.
//

import Foundation

protocol CurrencyRepositoryProtocol {
    func getData(completionHandler: @escaping (Result<CurrenciesResponse, Error>) -> Void)
}
