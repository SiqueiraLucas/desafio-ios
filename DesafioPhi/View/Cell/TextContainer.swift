//
//  TextContainer.swift
//  DesafioPhi
//
//  Created by Lucas Siqueira on 06/04/21.
//

import UIKit

class TextContainer: UIStackView{
    
    //MARK: Instances
    
    lazy var typeTransaction: UILabel = {
        let view = UILabel(frame: .zero)
        view.text = "None"
        view.font = view.font.withSize(18)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var favored: UILabel = {
        let view = UILabel(frame: .zero)
        view.textColor = .grayMain
        view.text = "None"
        view.font = view.font.withSize(17)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var amount: UILabel = {
        let view = UILabel(frame: .zero)
        view.text = "R$: 00,00"
        view.font = UIFont.boldSystemFont(ofSize: 18)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
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

extension TextContainer: ViewCode{
    func setupConfiguration() {
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    func addViewHierarchy(){
        addArrangedSubview(typeTransaction)
        addArrangedSubview(favored)
        addArrangedSubview(amount)
    }
    
    func configureConstraints(){
        self.axis = .vertical
        self.alignment = .leading
        self.distribution = .fillProportionally
        self.spacing = 10
    }
}
