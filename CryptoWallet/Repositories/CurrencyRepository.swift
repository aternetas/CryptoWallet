//
//  CurrencyRepository.swift
//  CryptoWallet
//
//  Created by aternetas on 17.07.2025.
//

import Foundation

final class CurrencyRepository: CurrencyRepositoryProtocol {
    private let url: URL = URL(string: "https://data.messari.io/api/v1/assets")!
    
    func getData(completionHandler: @escaping (Result<CurrenciesResponse, Error>) -> Void) {
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else {
                completionHandler(.failure(error!))
                assertionFailure(error!.localizedDescription)
                return
            }
            
            do {
                let result = try JSONDecoder().decode(CurrenciesResponse.self, from: data)
                completionHandler(.success(result))
            }
            catch {
                completionHandler(.failure(error))
                assertionFailure(error.localizedDescription)
            }
        }
        
        task.resume()
    }
}
