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
    
    init(repository: CurrencyRepository) {
        self.repository = repository
    }
    
    func getData(completionHandler: @escaping (Result<[Currency], Error>) -> Void) {
        repository.getData { response in
            switch response {
            case .success(let response):
                let names: Set<String> = ["Bitcoin", "Ethereum", "XRP", "TRON", "LUNA", "Dogecoin", "Tether", "Stellar", "Cardano"]
                
                completionHandler(.success(
                    response.data
                        .filter { names.contains($0.name) }
                        .map { Currency(dto: $0) }
                ))
            case .failure(let error):
                completionHandler(.failure(error))
            }
        }
    }
}
