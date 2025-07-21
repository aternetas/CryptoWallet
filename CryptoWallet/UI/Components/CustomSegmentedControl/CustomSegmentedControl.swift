//
//  CustomSegmentedControl.swift
//  CryptoWallet
//
//  Created by aternetas on 21.07.2025.
//

import UIKit

protocol CustomSegmentedControlDelegate: AnyObject {
    func tapOnButton(index: Int)
}

final class CustomSegmentedControl: UIStackView {
    weak var delegate: CustomSegmentedControlDelegate?
    
    var selectedIndex: Int {
        buttons.firstIndex { $0.isSelectedButton == true } ?? 0
    }
    
    private let buttons: [CustomSegmentedControlButton]
    
    init(buttons: [CustomSegmentedControlButton]) {
        self.buttons = buttons
        super.init(frame: .zero)
        setupView()
        bind()
    }
    
    @available(*, unavailable)
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func bind() {
        buttons.forEach { button in
            button.layer.cornerRadius = 25.0
            button.layer.cornerCurve = .circular
            
            button.setTitle(button.title, for: .normal)
            button.titleLabel?.font = .semibold14
            
            button.setStartSelectedIndex()
            button.tag = button.index
            
            button.addAction(UIAction { [weak self] _ in
                self?.tapOnButton(button: button)
            }, for: .touchUpInside)
            
            addArrangedSubview(button)
        }
    }
    
    private func tapOnButton(button: UIButton) {
        delegate?.tapOnButton(index: button.tag)
        updateUI(selectedIndex: button.tag)
    }
    
    private func updateUI(selectedIndex: Int) {
        buttons.forEach { $0.isSelectedButton = $0.index == selectedIndex }
    }
    
    private func setupView() {
        distribution = .fillEqually
        axis = .horizontal
        spacing = 0
        
        layer.backgroundColor = UIColor(resource: .paleGray).cgColor
        layer.cornerRadius = 30
    }
}
