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
        
        NotificationCenter.default.addObserver(forName: UIApplication.keyboardWillHideNotification,
                                               object: nil,
                                               queue: .main) { [weak self] notification in
            let rect = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue ?? .zero
            self?.adjustKeyboard(rect: rect, isShow: false)
        }

        NotificationCenter.default.addObserver(forName: UIApplication.keyboardWillShowNotification,
                                               object: nil,
                                               queue: .main) { [weak self] notification in
            let rect = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue ?? .zero
            self?.adjustKeyboard(rect: rect, isShow: true)
        }
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.navigationManager = self
        viewModel.alertManager = self
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self, name: UIApplication.keyboardWillHideNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIApplication.keyboardWillShowNotification, object: nil)
    }
    
    func setAsRootViewController(_ viewController: UIViewController) {
        UIApplication.shared.firstKeyWindow?.rootViewController = viewController
    }
    
    func popViewController() {
        navigationController?.popViewController(animated: true)
    }
    
    func adjustKeyboard(rect: CGRect, isShow: Bool) { }

    @objc func handleSwipeRight() {
        popViewController()
    }
}

extension BaseViewController: NavigationManagerProtocol {
    func openScreen(screen: ScreenType) {
        let viewController: UIViewController
        
        switch screen {
        case .currency(let id):
            let vc = CurrencyViewController()
            vc.viewModel.setCurrency(id)
            viewController = vc
        }
        
        navigationController?.pushViewController(viewController, animated: true)
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
