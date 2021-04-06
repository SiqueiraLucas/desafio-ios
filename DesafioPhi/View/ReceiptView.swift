//
//  ReceiptView.swift
//  DesafioPhi
//
//  Created by Lucas Siqueira on 06/04/21.
//

import UIKit

class ReceiptView: UIView{
    
    //MARK: Instances
    
    let receiptContainer = ReceiptContainer()
    
    lazy var shareButton: UIButton = {
        let view = UIButton(frame: .zero)
        view.setTitle("Compartilhar", for: .normal)
        view.titleLabel?.font = UIFont.boldSystemFont(ofSize: 17)
        view.backgroundColor = .greenMain
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

extension ReceiptView: ViewCode{
    func setupConfiguration() {
        backgroundColor = .white
    }
    
    func addViewHierarchy(){
        addSubview(receiptContainer)
        addSubview(shareButton)
    }
    
    func configureConstraints(){
        // Receipt Container
        receiptContainer.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20).isActive = true
        receiptContainer.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20).isActive = true
        receiptContainer.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 30).isActive = true
        
        // Share Button
        shareButton.heightAnchor.constraint(equalToConstant: 66).isActive = true
        shareButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20).isActive = true
        shareButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20).isActive = true
        shareButton.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
}
