//
//  UserDefaultsServiceProtocol.swift
//  CryptoWallet
//
//  Created by aternetas on 25.07.2025.
//

import Foundation

protocol UserDefaultsServiceProtocol {
    var isAuthorized: Bool { get }
    func setNewValue(value: Any?, key: UserDefaultsKey)
    func getValue<T>(type: T.Type, key: UserDefaultsKey) -> T?
}
