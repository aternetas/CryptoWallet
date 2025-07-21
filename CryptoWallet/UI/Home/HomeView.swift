//
//  HomeView.swift
//  CryptoWallet
//
//  Created by aternetas on 12.07.2025.
//

import UIKit
import SnapKit

final class HomeView: BaseView, BaseViewProtocol {
    private lazy var homeLabel: UILabel = .init(text: "Home",
                                                font: .semibold32,
                                                textColor: .white)
    
    private lazy var affiliateProgramLabel: UILabel = .init(text: "Affiliate program",
                                                            font: .medium20,
                                                            textColor: .white)
    
    private lazy var learnMoreButton: UIButton = .init(text: "Learn more",
                                                       textColor: .black,
                                                       font: .semibold14,
                                                       backgroundColor: .white,
                                                       cornerRadius: 40.0)
    
    private(set) lazy var menuButton: UIButton = .init(image: .dots,
                                                  backgroundColor: .white)
    
    private(set) lazy var menuView: MenuView = .init()
    
    private lazy var stackImageView: UIImageView = .init(image: .stack)
    
    private lazy var cardView: CardView = .init()
    
    private lazy var trendingLabel: UILabel = .init(text: "Trending",
                                                    font: .medium20,
                                                    textColor: .black)
    
    private lazy var sortButton: UIButton = .init(image: .order)
    
    private(set) lazy var trendingCurrenciesTableView: UITableView = {
        let tableView = UITableView()
        tableView.register(TrendingCurrencyCell.self, forCellReuseIdentifier: TrendingCurrencyCell.identifier)
        tableView.separatorStyle = .none
        tableView.backgroundColor = .clear
        return tableView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
        initConstraints()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        backgroundColor = .pink
        menuView.isHidden = true
    }
    
    func initConstraints() {
        addSubviews([homeLabel,
                     affiliateProgramLabel,
                     learnMoreButton,
                     menuButton,
                     stackImageView,
                     menuView,
                     cardView])
        
        cardView.addSubviews([trendingLabel,
                              sortButton,
                              trendingCurrenciesTableView])
        
        homeLabel.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide).offset(10)
            make.leading.equalToSuperview().offset(25)
        }
        
        affiliateProgramLabel.snp.makeConstraints { make in
            make.top.equalTo(homeLabel.snp.bottom).offset(46)
            make.leading.equalToSuperview().offset(25)
        }
        
        learnMoreButton.snp.makeConstraints { make in
            make.top.equalTo(affiliateProgramLabel.snp.bottom).offset(12)
            make.leading.equalToSuperview().offset(25)
            make.height.equalTo(35)
        }
        
        menuButton.snp.makeConstraints { make in
            make.trailing.equalToSuperview().inset(25)
            make.centerY.equalTo(homeLabel.snp.centerY)
            make.height.width.equalTo(48)
        }
        
        menuView.snp.makeConstraints { make in
            make.top.equalTo(menuButton.snp.bottom).offset(8)
            make.trailing.equalToSuperview().inset(29)
        }
        
        stackImageView.snp.makeConstraints { make in
            make.top.equalTo(menuButton.snp.bottom).offset(21)
            make.trailing.equalToSuperview().inset(-56)
            make.height.width.equalTo(242)
        }
        
        cardView.snp.makeConstraints { make in
            make.top.equalTo(learnMoreButton.snp.bottom).offset(55)
            make.leading.trailing.bottom.equalToSuperview()
        }
        
        trendingLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(24)
            make.leading.equalToSuperview().offset(25)
        }
        
        sortButton.snp.makeConstraints { make in
            make.trailing.equalToSuperview().inset(25)
            make.centerY.equalTo(trendingLabel.snp.centerY)
            make.height.width.equalTo(24)
        }
        
        trendingCurrenciesTableView.snp.makeConstraints { make in
            make.top.equalTo(trendingLabel.snp.bottom).offset(16)
            make.leading.trailing.bottom.equalToSuperview()
        }
    }
}
