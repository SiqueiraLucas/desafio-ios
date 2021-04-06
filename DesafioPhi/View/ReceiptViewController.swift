//
//  ReceiptViewController.swift
//  DesafioPhi
//
//  Created by Lucas Siqueira on 14/03/21.
//

import Foundation
import UIKit

class ReceiptViewController: UIViewController {
    
    //MARK: Instances
    
    @IBOutlet weak var typeTransaction: UILabel!
    @IBOutlet weak var amount: UILabel!
    @IBOutlet weak var favored: UILabel!
    @IBOutlet weak var bank: UILabel!
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var authentication: UILabel!
    @IBOutlet weak var shareButton: UIButton!
    
    let receiptViewModel = ReceiptViewModel(receipt: ReceiptModel())
    var sharePresenter: SharePresenterProtocol?
    
    //MARK: Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        navigationControllerSetup()
    }
    
    //MARK: Functions
    
    @IBAction func prepareShare(_ sender: Any) {
        hideItems()
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.01, execute: share)
    }
    
    func share(){
        sharePresenter?.presentShare(on: self, completion: hideItems)
    }
    
    func hideItems(){
        shareButton.isHidden = !shareButton.isHidden
        if shareButton.isHidden{
            navigationController?.navigationBar.tintColor = .white
        }else{
            navigationController?.navigationBar.tintColor = UIColor(named: "BlackMainColor")
        }
    }
}

//MARK: Protocol Setup

extension ReceiptViewController: ViewControllerProtocol{
    
    func additionalSetup() {
        sharePresenter = SharePresenter()
    }
    
    func closureSetup()  {
        receiptViewModel.reloadData = { [weak self] ()  in
            DispatchQueue.main.async {
                self?.typeTransaction.text = self?.receiptViewModel.typeTransaction
                self?.amount.text = self?.receiptViewModel.amount
                self?.favored.text = self?.receiptViewModel.favored
                self?.bank.text = self?.receiptViewModel.bank
                self?.date.text = self?.receiptViewModel.date
                self?.authentication.text = self?.receiptViewModel.authentication
            }
        }
        receiptViewModel.errorMessage = { (error)  in
            DispatchQueue.main.async {
                print("Error: \(error)")
            }
        }
    }
    
    func getContentSetup(){
        receiptViewModel.getContentData()
    }
    
    func navigationControllerSetup(){
        navigationController?.navigationBar.setBackgroundImage(nil, for: .default)
        navigationController?.navigationBar.shadowImage = nil
    }
    
}
