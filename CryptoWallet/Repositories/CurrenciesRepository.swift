//
//  CurrenciesRepository.swift
//  CryptoWallet
//
//  Created by aternetas on 17.07.2025.
//

import Foundation

final class CurrenciesRepository {
    private let url: URL = URL(string: "https://data.messari.io/api/v1/assets")!
    
    func getData(completionHandler: @escaping (CurrenciesResponse) -> ()) {
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else {
                assertionFailure(error!.localizedDescription)
                return
            }
            
            do {
                let result = try JSONDecoder().decode(CurrenciesResponse.self, from: data)
                completionHandler(result)
            }
            catch {
                assertionFailure(error.localizedDescription)
            }
        }
        
        task.resume()
    }
}
