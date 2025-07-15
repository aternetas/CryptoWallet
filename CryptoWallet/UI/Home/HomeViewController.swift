//
//  HomeViewController.swift
//  CryptoWallet
//
//  Created by aternetas on 09.07.2025.
//

import UIKit

final class HomeViewController: BaseViewController<HomeViewModel, HomeView> {
    
    override init() {
        super.init()
        
        viewModel = HomeViewModel()
        rootView = HomeView()
    }
    
    @MainActor required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        
        view = rootView
    }
}
