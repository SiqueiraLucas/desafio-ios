//
//  ReceiptViewModel.swift
//  DesafioPhi
//
//  Created by Lucas Siqueira on 14/03/21.
//

import Foundation
import UIKit

class ReceiptViewModel: ViewModelProtocol{
    
    //MARK: - Instances
    
    private var receipt = ReceiptModel() {
        didSet{
            reloadData()
        }
    }
    
    var typeTransaction: String?{
        return receipt.description
    }

    var favored: String?{
        return receipt.to
    }
    
    var bank: String?{
        return "Banco Phi"
    }
    
    var authentication: String?{
        return receipt.authentication
    }
    
    var id: String?
    
    var amount: String? {
        guard let amount = receipt.amount as NSNumber? else {return ""}
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.maximumFractionDigits = 2
        let amountFormatter = formatter.string(from: amount)
        return amountFormatter
    }
    
    var date: String?{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        guard let dateFromString : Date = dateFormatter.date(from: receipt.createdAt ?? "") else {return ""}
        dateFormatter.dateFormat = "dd/MM/yyyy"
        let newDate = dateFormatter.string(from: dateFromString)
        return newDate
    }
    
    //MARK: Initializer
    
    init (receipt: ReceiptModel){
        self.receipt = receipt
    }
    
    //MARK: Protocol Setup
    
    var reloadData = {() -> () in }
    var errorMessage = {(error : Error) -> () in }
    var requestResult = "Loading"
    
    func getContentData(){
        APIRequest.getContent(endpoint: "myStatement/detail/\(id ?? "")/") { [weak self] (result: Result<ReceiptModel, Error>) in
            switch result {
                case .success(let data):
                    self?.requestResult = "Sucess"
                    self?.receipt = data
                    
                case .failure(let error):
                    self?.requestResult = "Erro: \(error)"
                    self?.errorMessage(error)
            }
        }
    }
}
