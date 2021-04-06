//
//  ExtractViewModel.swift
//  DesafioPhi
//
//  Created by Lucas Siqueira on 13/03/21.
//

import Foundation
import UIKit

class ExtractViewModel: ViewModelProtocol {
    
    //MARK: - Instances
    
    private var extracts : [Item] = [] {
        didSet{
            reloadData()
        }
    }
    
    var countItems : Int {
        return extracts.count
    }
    
    private let itemsPerRequest = 10
    
    //MARK: Initializer
    
    init (extracts: [Item]){
        self.extracts = extracts
    }
    
    //MARK: Functions
    
    func returnIdTransaction(index: Int) -> String?{
        return extracts[index].id
    }
    
    func returnTypeTransaction(index: Int) -> String?{
        return extracts[index].description
    }
    
    func returnFavored(index: Int) -> String?{
        if extracts[index].tType == "BANKSLIPCASHIN"{
            return "Sua Conta"
        }else if extracts[index].to != nil{
            return extracts[index].to
        }else{
            return extracts[index].from
        }
    }
    
    func returnAmount (index: Int) -> String? {
        guard let amount = extracts[index].amount else {return nil}
        let amountNumber = amount as NSNumber
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.maximumFractionDigits = 2
        let amountFormatter = formatter.string(from: amountNumber)
        return amountFormatter
    }
    
    func returnPix (index: Int) -> Bool{
        if extracts[index].tType == "PIXCASHIN" || extracts[index].tType == "PIXCASHOUT"{
            return true
        }else{
            return false
        }
    }
    
    func returnDate (index: Int) -> String?{
        guard let date = extracts[index].createdAt else {return nil}
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        guard let dateFromString : Date = dateFormatter.date(from: date) else {return ""}
        dateFormatter.dateFormat = "dd/MM"
        let newDate = dateFormatter.string(from: dateFromString)
        return newDate
    }
    
    //MARK: Protocol Setup
    
    var reloadData = {() -> () in }
    var errorMessage = {(error : Error) -> () in }
    var requestResult = "Loading"
    
    func getContentData(){
        APIRequest.getContent(endpoint: "myStatement/\(itemsPerRequest)/\(countItems/itemsPerRequest)/") { [weak self] (result: Result<ExtractModel, Error>) in
            switch result {
                case .success(let data):
                    self?.requestResult = "Sucess"
                    self?.extracts.append(contentsOf: data.items)
                    
                case .failure(let error):
                    self?.requestResult = "Erro: \(error)"
                    self?.errorMessage(error)
            }
        }
    }
    
}
