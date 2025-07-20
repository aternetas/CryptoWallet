//
//  BaseViewController.swift
//  CryptoWallet
//
//  Created by aternetas on 12.07.2025.
//

import UIKit

class BaseViewController<VM: BaseViewModel, V: BaseView>: UIViewController {
    var rootView: V!
    var viewModel: VM!
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.alertManager = self
    }
    
    func setAsRootViewController(_ viewController: UIViewController) {
        UIApplication.shared.firstKeyWindow?.rootViewController = viewController
    }
}

extension BaseViewController: AlertManagerProtocol {
    func showAlert(model: AlertModel) {
        let alert = UIAlertController(title: model.title,
                                      message: model.message,
                                      preferredStyle: .alert)
        
        model.actions.forEach { action in
            alert.addAction(UIAlertAction(title: action.title,
                                          style: action.style,
                                          handler: { _ in
                action.action()
            }))}
        
        present(alert, animated: true)
    }
}
