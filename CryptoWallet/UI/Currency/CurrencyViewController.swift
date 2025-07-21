//
//  CurrencyViewController.swift
//  CryptoWallet
//
//  Created by aternetas on 21.07.2025.
//

import UIKit

final class CurrencyViewController: BaseViewController<CurrencyViewModel, CurrencyView> {
    override init() {
        super.init()
        
        viewModel = CurrencyViewModel()
        viewModel.delegate = self
        
        rootView = CurrencyView()
        rootView.customSegmentedControl.delegate = self
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
        
        addButtonActions()
    }
    
    private func addButtonActions() {
        rootView.backButton.addAction(UIAction { [weak self] _ in
            self?.tapOnBackButton()
        }, for: .touchUpInside)
    }
    
    private func tapOnBackButton() {
        popViewController()
    }
}

extension CurrencyViewController: CurrencyViewModelDelegate {
    func updateData(vm: CurrencyVM) {
        DispatchQueue.main.async { [weak self] in
            self?.rootView.bind(vm: vm)
        }
    }
}

extension CurrencyViewController: CustomSegmentedControlDelegate {
    func tapOnButton(index: Int) {
        if let type = CurrencyForPeriodType.allCases.first(where: { $0.index == index }) {
            switch type {
            case .day:
                return
            case .week:
                return
            case .year:
                return
            case .all:
                return
            case .point:
                return
            }
        }
    }
}
