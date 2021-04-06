//
//  ExtractView.swift
//  DesafioPhi
//
//  Created by Lucas Siqueira on 06/04/21.
//

import UIKit

class ExtractView: UIView{
    
    //MARK: Instances
    
    var balanceView = BalanceView()
    
    lazy var titleTransaction: UILabel = {
        let view = UILabel(frame: .zero)
        view.textColor = .blackMain
        view.font = UIFont.boldSystemFont(ofSize: 17)
        view.text = "Suas Movimentações"
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var activityIndicator: UIActivityIndicatorView = {
        let view = UIActivityIndicatorView()
        view.startAnimating()
        return view
    }()
    
    lazy var tableView :UITableView = {
        let view = UITableView(frame: .zero)
        view.register(TransactionsViewCell.self, forCellReuseIdentifier: "cell")
        view.separatorStyle = .none
        view.backgroundView = activityIndicator
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    //MARK: Initializer
    
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: Extension

extension ExtractView: ViewCode{
    func setupConfiguration() {
        backgroundColor = .white
    }
    
    func addViewHierarchy(){
        addSubview(balanceView)
        addSubview(titleTransaction)
        addSubview(tableView)
    }
    
    func configureConstraints(){
        // Balance View
        balanceView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor).isActive = true
        balanceView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor).isActive = true
        balanceView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor).isActive = true
        balanceView.bottomAnchor.constraint(equalTo: titleTransaction.topAnchor, constant: -20).isActive = true
        
        // Title Transaction
        titleTransaction.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20).isActive = true
        titleTransaction.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20).isActive = true
        titleTransaction.topAnchor.constraint(equalTo: balanceView.bottomAnchor, constant: 20).isActive = true
        titleTransaction.bottomAnchor.constraint(equalTo: tableView.topAnchor, constant: -10).isActive = true
        
        // Table View
        tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        tableView.topAnchor.constraint(equalTo: titleTransaction.bottomAnchor, constant: 10).isActive = true
        tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        
    }
}
