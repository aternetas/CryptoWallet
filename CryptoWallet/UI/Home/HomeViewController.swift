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
        viewModel.delegate = self
        rootView = HomeView()
        
        rootView.menuView.delegate = self
        
        rootView.trendingCurrenciesTableView.delegate = self
        rootView.trendingCurrenciesTableView.dataSource = self
    }
    
    @available(*, unavailable)
    @MainActor required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        
        view = rootView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.getData()
        addButtonActions()
    }
    
    private func addButtonActions() {
        rootView.menuButton.addAction(UIAction { [weak self] _ in
            self?.tapOnMenuButton()
        }, for: .touchUpInside)
    }
    
    private func tapOnMenuButton() {
        viewModel.changeMenuVisibility()
    }
}

extension HomeViewController: HomeViewModelDelegate {
    func updateData() {
        DispatchQueue.main.async { [weak self] in
            self?.rootView.trendingCurrenciesTableView.reloadData()
        }
    }
    
    func changeMenuVisibility() {
        rootView.menuView.isHidden = !rootView.menuView.isHidden
    }
    
    func logOut() {
        setAsRootViewController(LoginViewController())
    }
}

extension HomeViewController: MenuViewDelegateProtocol {
    func tapOnMenuCell(_ type: MenuType) {
        switch type {
        case .refresh:
            viewModel.refreshData()
        case .exit:
            viewModel.logOut()
        }
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.currenciesVM.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: TrendingCurrencyCell = tableView.dequeueReusableCell(withIdentifier: TrendingCurrencyCell.identifier, for: indexPath) as! TrendingCurrencyCell
        cell.bind(vm: TrendingCurrencyVM(model: viewModel.currenciesVM[indexPath.item]))
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}
