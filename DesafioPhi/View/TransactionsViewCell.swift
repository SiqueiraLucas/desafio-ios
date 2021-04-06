//
//  TransactionsCell.swift
//  DesafioPhi
//
//  Created by Lucas Siqueira on 11/03/21.
//

import Foundation
import UIKit

class TransactionsViewCell: UITableViewCell{
    @IBOutlet weak var typeTransaction: UILabel!
    @IBOutlet weak var favored: UILabel!
    @IBOutlet weak var amount: UILabel!
    @IBOutlet weak var pix: UILabel!
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var circleView: UIView!{
        didSet{
            super.layoutSubviews()
            circleView.layer.cornerRadius = circleView.bounds.size.width / 2
            circleView.layer.masksToBounds = true
        }
    }
    @IBOutlet weak var lineConstraint: NSLayoutConstraint!
    
}
