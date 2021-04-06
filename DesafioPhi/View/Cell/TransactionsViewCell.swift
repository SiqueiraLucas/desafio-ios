//
//  TransactionsCell.swift
//  DesafioPhi
//
//  Created by Lucas Siqueira on 11/03/21.
//

import UIKit

class TransactionsViewCell: UITableViewCell{
    
    //MARK: Instances
    
    let timelineView = TimelineView(frame: .zero)
    let textContainer = TextContainer(frame: .zero)
    let informationContainer = InformationContainer(frame: .zero)
    
    //MARK: Initializer
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: Extension

extension TransactionsViewCell: ViewCode{
    func setupConfiguration() {
        backgroundColor = .white
    }
    
    func addViewHierarchy(){
        contentView.addSubview(timelineView)
        contentView.addSubview(textContainer)
        contentView.addSubview(informationContainer)
    }
    
    func configureConstraints(){
        // Design View
        timelineView.widthAnchor.constraint(equalToConstant: 10).isActive = true
        timelineView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 22).isActive = true
        timelineView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        timelineView.centerYAnchor.constraint(equalTo: textContainer.centerYAnchor).isActive = true
        timelineView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        
        // Text Container
        textContainer.leadingAnchor.constraint(equalTo: timelineView.trailingAnchor, constant: 20).isActive = true
        textContainer.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        textContainer.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10).isActive = true

        // Information Container
        informationContainer.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20).isActive = true
        informationContainer.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true

    }
}
