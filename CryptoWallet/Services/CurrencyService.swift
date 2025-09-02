//
//  CurrencyService.swift
//  CryptoWallet
//
//  Created by aternetas on 20.07.2025.
//

import Foundation

final class CurrencyService: CurrencyServiceProtocol {
    static let shared = CurrencyService(repository: CurrencyRepository())
    
    static let currencyNames: Set<String> = ["Bitcoin", "Ethereum", "XRP", "TRON", "LUNA", "Dogecoin", "Tether", "Stellar", "Cardano"]
    
    private let repository: CurrencyRepositoryProtocol
    
    private(set) var currencies: [Currency] = []
    
    init(repository: CurrencyRepositoryProtocol) {
        self.repository = repository
    }
    
    func getCurrencies(names: Set<String> = currencyNames,
                       completionHandler: @escaping (Result<[Currency], Error>) -> Void) {
        getData { result in
            switch result {
            case .success(let currencies):
                completionHandler(.success(currencies.filter { names.contains($0.name) }))
            case .failure(let error):
                completionHandler(.failure(error))
            }
        }
    }
    
    func getCurrency(name: String,
                     completionHandler: @escaping (Result<Currency, Error>) -> Void) {
        getData { result in
            switch result {
            case .success(let currencies):
                if let currency = currencies.first(where: { name.contains($0.name) }) {
                    completionHandler(.success(currency))
                }
            case .failure(let error):
                completionHandler(.failure(error))
            }
        }
    }
    
    private func getData(completionHandler: @escaping (Result<[Currency], Error>) -> Void) {
        repository.getData { [weak self] response in
            guard let self else { return }
            switch response {
            case .success(let response):
                currencies = response.data
                    .map { Currency(dto: $0) }
                
                completionHandler(.success(currencies))
            case .failure(let error):
                completionHandler(.failure(error))
            }
        }
    }
}
