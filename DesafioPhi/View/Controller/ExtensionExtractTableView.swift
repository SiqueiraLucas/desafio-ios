//
//  TableView.swift
//  DesafioPhi
//
//  Created by Lucas Siqueira on 14/03/21.
//

import Foundation
import UIKit

extension ExtractViewController: UITableViewDelegate, UITableViewDataSource{
    
    //MARK: Setup
    
    func tableViewSetup()  {
        extractView.tableView.dataSource = self
        extractView.tableView.delegate = self
    }
    
    //MARK: Functions
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return extractViewModel.countItems
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TransactionsViewCell
        cell.textContainer.typeTransaction.text = extractViewModel.returnTypeTransaction(index: indexPath.row)
        cell.textContainer.favored.text = extractViewModel.returnFavored(index: indexPath.row)
        cell.informationContainer.date.text = extractViewModel.returnDate(index: indexPath.row)
        cell.informationContainer.pix.isHidden = !extractViewModel.returnPix(index: indexPath.row)
        cell.textContainer.amount.text = extractViewModel.returnAmount(index: indexPath.row)
        cell.timelineView.activeCustomConstraint = indexPath.row == 0 ? true : false
        cell.backgroundColor = extractViewModel.returnPix(index: indexPath.row) == true ? UIColor(named: "WhiteMainColor") : UIColor.white
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == extractViewModel.countItems - 5 {
            extractViewModel.getContentData()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let nextViewController = ReceiptViewController()
        nextViewController.receiptViewModel.id = self.extractViewModel.returnIdTransaction(index: indexPath.row)
        self.navigationController?.pushViewController(nextViewController, animated: true)
    }
}
