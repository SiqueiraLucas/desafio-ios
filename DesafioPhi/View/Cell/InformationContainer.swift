//
//  InformationContainer.swift
//  DesafioPhi
//
//  Created by Lucas Siqueira on 06/04/21.
//

import UIKit

class InformationContainer: UIStackView{
    
    //MARK: Instances
    
    lazy var pix: UILabel = {
        let view = UILabel(frame: .zero)
        view.text = "Pix"
        view.textColor = .white
        view.font = view.font.withSize(11)
        view.textAlignment = .center
        view.backgroundColor = .greenMain
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var date: UILabel = {
        let view = UILabel(frame: .zero)
        view.text = "10,10"
        view.textColor = .grayMain
        view.font = view.font.withSize(17)
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

extension InformationContainer: ViewCode{
    func setupConfiguration() {
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    func addViewHierarchy(){
        addArrangedSubview(pix)
        addArrangedSubview(date)
    }
    
    func configureConstraints(){
        self.axis = .vertical
        self.alignment = .center
        self.distribution = .fillProportionally
        self.spacing = 5
        
        pix.widthAnchor.constraint(equalTo: date.widthAnchor).isActive = true
        pix.heightAnchor.constraint(equalToConstant: 21).isActive = true
    }
}
