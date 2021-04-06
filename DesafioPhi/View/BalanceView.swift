//
//  BalanceView.swift
//  DesafioPhi
//
//  Created by Lucas Siqueira on 06/04/21.
//

import UIKit

class BalanceView: UIView{
    
    //MARK: Instances
    
    lazy var eyeButton: UIButton = {
        let view = UIButton(frame: .zero)
        view.setImage(UIImage(systemName: "eye.fill"), for: .normal)
        view.tintColor = .greenMain
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var balanceLabel: UILabel = {
        let view = UILabel(frame: .zero)
        view.font = UIFont.boldSystemFont(ofSize: 30)
        view.textColor = .greenMain
        view.text = "R$: 00,00"
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var titleBalanceLabel: UILabel = {
        let view = UILabel(frame: .zero)
        view.textColor = .blackMain
        view.font = view.font.withSize(17)
        view.text = "Seu Saldo"
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

extension BalanceView: ViewCode{
    func setupConfiguration() {
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .whiteMain
    }
    
    func addViewHierarchy(){
        addSubview(titleBalanceLabel)
        addSubview(eyeButton)
        addSubview(balanceLabel)
    }
    
    func configureConstraints(){
        // Title Balance
        titleBalanceLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20).isActive = true
        titleBalanceLabel.trailingAnchor.constraint(equalTo: eyeButton.leadingAnchor, constant: -20).isActive = true
        titleBalanceLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 20).isActive = true
        titleBalanceLabel.bottomAnchor.constraint(equalTo: balanceLabel.topAnchor, constant: -20).isActive = true
        titleBalanceLabel.centerYAnchor.constraint(equalTo: eyeButton.centerYAnchor).isActive = true
        
        // Eye Button
        eyeButton.leadingAnchor.constraint(equalTo: titleBalanceLabel.trailingAnchor, constant: 20).isActive = true
        eyeButton.centerYAnchor.constraint(equalTo: titleBalanceLabel.centerYAnchor).isActive = true
        
        // Balance Label
        balanceLabel.leadingAnchor.constraint(equalTo: titleBalanceLabel.leadingAnchor).isActive = true
        balanceLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20).isActive = true
        balanceLabel.topAnchor.constraint(equalTo: titleBalanceLabel.bottomAnchor, constant: 20).isActive = true
        balanceLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -20).isActive = true
    }
}
