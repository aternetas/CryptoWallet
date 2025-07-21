//
//  BaseViewModel.swift
//  CryptoWallet
//
//  Created by aternetas on 12.07.2025.
//

import UIKit

struct AlertModel {
    let title: String
    let message: String
    let actions: [AlertActionModel]
}

struct AlertActionModel {
    let title: String
    let style: UIAlertAction.Style
    let action: () -> ()
}

protocol AlertManagerProtocol: AnyObject {
    func showAlert(model: AlertModel)
}

protocol NavigationManagerProtocol: AnyObject {
    func openScreen(screen: ScreenType)
}

class BaseViewModel {
    weak var navigationManager: NavigationManagerProtocol?
    weak var alertManager: AlertManagerProtocol?
    
    func showAlert(model: AlertModel) {
        alertManager?.showAlert(model: model)
    }
}
