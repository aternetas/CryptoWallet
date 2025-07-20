//
//  UserDefaultsService.swift
//  CryptoWallet
//
//  Created by aternetas on 20.07.2025.
//

import Foundation

enum UserDefaultsKey: String {
    case IS_AUTORIZED = "isAuth"
}

final class UserDefaultsService {
    static let shared = UserDefaultsService()
    
    var isAutorized: Bool {
        getValue(type: Bool.self, key: .IS_AUTORIZED) ?? false
    }
    
    private let defaults = UserDefaults.standard
    
    func setNewValue(value: Any?, key: UserDefaultsKey) {
        defaults.set(value, forKey: key.rawValue)
    }
    
    func getValue<T>(type: T.Type, key: UserDefaultsKey) -> T? {
        defaults.object(forKey: key.rawValue) as? T
    }
}
