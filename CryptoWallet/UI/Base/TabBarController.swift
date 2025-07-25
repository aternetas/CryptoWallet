//
//  TabBarController.swift
//  CryptoWallet
//
//  Created by aternetas on 16.07.2025.
//

import UIKit

final class TabBarController: UITabBarController {
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
        setupTabs()
        setupAppearance()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupTabs() {
        let homeVC = HomeViewController()
        homeVC.tabBarItem = UITabBarItem(title: "", image: .home, tag: 0)

        let navigationVC = UINavigationController(rootViewController: homeVC)
        navigationVC.isNavigationBarHidden = true
        
        let currenciesVC = AnyVC()
        currenciesVC.tabBarItem = UITabBarItem(title: "", image: .currencies, tag: 1)
        
        let walletVC = AnyVC()
        walletVC.tabBarItem = UITabBarItem(title: "", image: .wallet, tag: 2)
        
        let historyVC = AnyVC()
        historyVC.tabBarItem = UITabBarItem(title: "", image: .history, tag: 3)
        
        let profileVC = AnyVC()
        profileVC.tabBarItem = UITabBarItem(title: "", image: .profile, tag: 4)
        
        viewControllers = [navigationVC, currenciesVC, walletVC, historyVC, profileVC]
    }
    
    private func setupAppearance() {
        tabBar.backgroundColor = .white
        tabBar.isTranslucent = false
        
        let appearance = UITabBarAppearance()
        appearance.stackedLayoutAppearance.normal.iconColor = .middleGray
        appearance.stackedLayoutAppearance.selected.iconColor = .black
        
        tabBar.standardAppearance = appearance
    }
}

final class AnyVC: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(red: .random(in: 0...1),
                                       green: .random(in: 0...1),
                                       blue: .random(in: 0...1),
                                       alpha: 1.0)
    }
}
