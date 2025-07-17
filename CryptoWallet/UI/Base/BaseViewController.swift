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
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setAsRootViewController(_ viewController: UIViewController) {
        UIApplication.shared.firstKeyWindow?.rootViewController = viewController
    }
}
