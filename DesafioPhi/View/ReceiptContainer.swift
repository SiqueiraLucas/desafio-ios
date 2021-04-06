//
//  ReceiptContainer.swift
//  DesafioPhi
//
//  Created by Lucas Siqueira on 06/04/21.
//

import UIKit

class ReceiptContainer: UIStackView{
    
    //MARK: Instances
    
    let typeTransaction = SectionContainer(title: "Tipo de Movimentação")
    let amount = SectionContainer(title: "Valor")
    let favored = SectionContainer(title: "Recebedor")
    let bank = SectionContainer(title: "Instituição Bancária")
    let date = SectionContainer(title: "Data/ Hora")
    let authentication = SectionContainer(title: "Autenticação")
    
    //MARK: Initializer
    
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        setupView()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: Extension

extension ReceiptContainer: ViewCode{
    func setupConfiguration() {
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    func addViewHierarchy(){
        addArrangedSubview(typeTransaction)
        addArrangedSubview(amount)
        addArrangedSubview(favored)
        addArrangedSubview(bank)
        addArrangedSubview(date)
        addArrangedSubview(authentication)
    }
    
    func configureConstraints(){
        axis = .vertical
        alignment = .leading
        distribution = .fill
        if UIScreen.main.bounds.size.height > 570{
            spacing = 30
        }else{
            spacing = 17
        }
    }
}
