//
//  TimelineView.swift
//  DesafioPhi
//
//  Created by Lucas Siqueira on 06/04/21.
//

import UIKit

class TimelineView: UIView{
    
    //MARK: Instances
    
    lazy var circleView: UIView = {
        let view = UIView(frame: .zero)
        view.layer.cornerRadius = 5
        view.layer.masksToBounds = true
        view.backgroundColor = .greenMain
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var lineTopView: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = .grayMain
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var lineBottomView: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = .grayMain
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var activeCustomConstraint: Bool = false{
        didSet{
            topConstraint2?.isActive = activeCustomConstraint
            topConstraint1?.isActive = !activeCustomConstraint
        }
    }
    
    var topConstraint1: NSLayoutConstraint?
    var topConstraint2: NSLayoutConstraint?
    
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

extension TimelineView: ViewCode{
    func setupConfiguration() {
        self.backgroundColor = .clear
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    func addViewHierarchy(){
        addSubview(circleView)
        addSubview(lineTopView)
        addSubview(lineBottomView)
    }
    
    func configureConstraints(){
        // Circle View
        circleView.widthAnchor.constraint(equalToConstant: 10).isActive = true
        circleView.heightAnchor.constraint(equalToConstant: 10).isActive = true
        circleView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        circleView.topAnchor.constraint(equalTo: lineTopView.bottomAnchor, constant: 4).isActive = true
        circleView.bottomAnchor.constraint(equalTo: lineBottomView.topAnchor, constant: -4).isActive = true
        circleView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        
        // Line Top
        lineTopView.widthAnchor.constraint(equalToConstant: 1).isActive = true
        lineTopView.centerXAnchor.constraint(equalTo: circleView.centerXAnchor).isActive = true
        lineTopView.bottomAnchor.constraint(equalTo: circleView.topAnchor, constant: -4).isActive = true
        topConstraint1 = lineTopView.topAnchor.constraint(equalTo: self.topAnchor)
        topConstraint2 = lineTopView.topAnchor.constraint(equalTo: self.topAnchor, constant: 10)
        activeCustomConstraint = false

        // Line Bottom
        lineBottomView.widthAnchor.constraint(equalToConstant: 1).isActive = true
        lineBottomView.centerXAnchor.constraint(equalTo: circleView.centerXAnchor).isActive = true
        lineBottomView.topAnchor.constraint(equalTo: circleView.bottomAnchor, constant: 4).isActive = true
        lineBottomView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    }
}
