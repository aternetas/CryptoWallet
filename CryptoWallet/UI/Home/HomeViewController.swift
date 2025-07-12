//
//  HomeViewController.swift
//  CryptoWallet
//
//  Created by aternetas on 09.07.2025.
//

import UIKit

final class HomeViewController: BaseViewController<HomeViewModel> {
    private let rootView = HomeView()
    
    override init() {
        super.init()
        
        viewModel = HomeViewModel()
    }
    
    @MainActor required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        
        view = rootView
    }
}
