//
//  SectionContainer.swift
//  DesafioPhi
//
//  Created by Lucas Siqueira on 06/04/21.
//

import UIKit

class SectionContainer: UIStackView{
    
    //MARK: Instances
    
    lazy var title: UILabel = {
        let view = UILabel(frame: .zero)
        view.textColor = .blackMain
        view.font = UIFont.boldSystemFont(ofSize: 17)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var information: UILabel = {
        let view = UILabel(frame: .zero)
        view.textColor = .blackMain
        view.font = view.font.withSize(17)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    //MARK: Initializer
    
    init(title: String) {
        super.init(frame: .zero)
        self.title.text = title
        setupView()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: Extension

extension SectionContainer: ViewCode{
    func setupConfiguration() {
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    func addViewHierarchy(){
        addArrangedSubview(title)
        addArrangedSubview(information)
    }
    
    func configureConstraints(){
        axis = .vertical
        alignment = .leading
        distribution = .fill
        if UIScreen.main.bounds.size.height > 570{
            spacing = 15
        }else{
            spacing = 10
        }
    }
}
