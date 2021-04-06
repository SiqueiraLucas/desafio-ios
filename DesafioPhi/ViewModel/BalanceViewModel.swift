//
//  BalanceViewModel.swift
//  DesafioPhi
//
//  Created by Lucas Siqueira on 11/03/21.
//

import Foundation
import UIKit

class BalanceViewModel: ViewModelProtocol{
    
    //MARK: - Instances
    
    private var balance = BalanceModel() {
        didSet {
            reloadData()
        }
    }
    
    var amount: String? {
        if Preferences.shared.hideBalance == false && balance.amount != nil{
            guard let amount = balance.amount else {return nil}
            let amountNumber = amount as NSNumber
            let formatter = NumberFormatter()
            formatter.numberStyle = .currency
            formatter.maximumFractionDigits = 2
            let amountFormatter = formatter.string(from: amountNumber)
            return amountFormatter
        }else{
            return "─────"
        }
    }
    
    var eyeImage: UIImage?{
        if Preferences.shared.hideBalance == false{
            return UIImage(systemName: "eye.fill")
        }else{
            return UIImage(systemName: "eye.slash.fill")
        }
    }
    
    //MARK: Initializer
    
    init (balance: BalanceModel){
        self.balance = balance
    }
    
    //MARK: Functions
    
    func hiddenAmount(){
        Preferences.shared.hideBalance = !Preferences.shared.hideBalance
        DataPersistence.shared.saveLocalData(data: Preferences.shared.hideBalance, key: "Hidden")
        reloadData()
    }
    
    //MARK: Protocol Setup
    
    var reloadData = {() -> () in }
    var errorMessage = {(error : Error) -> () in }
    var requestResult = "Loading"
    
    func getContentData(){
        APIRequest.getContent(endpoint: "myBalance/") { [weak self] (result: Result<BalanceModel, Error>) in
            switch result {
                case .success(let data):
                    self?.requestResult = "Sucess"
                    self?.balance = data
                    
                case .failure(let error):
                    self?.requestResult = "Erro: \(error)"
                    self?.errorMessage(error)
            }
        }
    }
}
