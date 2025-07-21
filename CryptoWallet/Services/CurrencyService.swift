//
//  CurrencyService.swift
//  CryptoWallet
//
//  Created by aternetas on 20.07.2025.
//

import Foundation

final class CurrencyService {
    static let shared = CurrencyService(repository: CurrencyRepository())
    
    private let repository: CurrencyRepository
    
    private(set) var currencies: [Currency] = []
    
    init(repository: CurrencyRepository) {
        self.repository = repository
    }
    
    func getData(completionHandler: @escaping (Result<[Currency], Error>) -> Void) {
        repository.getData { [weak self] response in
            guard let self else { return }
            switch response {
            case .success(let response):
                let names: Set<String> = ["Bitcoin", "Ethereum", "XRP", "TRON", "LUNA", "Dogecoin", "Tether", "Stellar", "Cardano"]
                
                currencies = response.data
                    .filter { names.contains($0.name) }
                    .map { Currency(dto: $0) }
                
                completionHandler(.success(currencies))
            case .failure(let error):
                completionHandler(.failure(error))
            }
        }
    }
}
