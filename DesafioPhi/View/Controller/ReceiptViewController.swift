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
    
    let receiptView = ReceiptView(frame: UIScreen.main.bounds)
    let receiptViewModel = ReceiptViewModel(receipt: ReceiptModel())
    var sharePresenter: SharePresenterProtocol?
    
    //MARK: Life Cycle
    
    override func loadView() {
        self.view = receiptView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        navigationControllerSetup()
    }
    
    //MARK: Functions
    
    @objc func prepareShare(sender: UIButton?) {
        hideItems()
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.01, execute: share)
    }
    
    func share(){
        sharePresenter?.presentShare(on: self, completion: hideItems)
    }
    
    func hideItems(){
        receiptView.shareButton.isHidden = !receiptView.shareButton.isHidden
        if receiptView.shareButton.isHidden{
            navigationController?.navigationBar.tintColor = .white
        }else{
            navigationController?.navigationBar.tintColor = UIColor(named: "BlackMainColor")
        }
    }
}

//MARK: Protocol Setup

extension ReceiptViewController: ViewControllerProtocol{
    
    func additionalSetup() {
        self.title = "Comprovante"
        sharePresenter = SharePresenter()
    }
    
    func targetsSetup() {
        receiptView.shareButton.addTarget(self, action: #selector(prepareShare), for: .touchUpInside)
    }
    
    func closureSetup()  {
        receiptViewModel.reloadData = { [weak self] ()  in
            DispatchQueue.main.async {
                self?.receiptView.receiptContainer.typeTransaction.information.text = self?.receiptViewModel.typeTransaction
                self?.receiptView.receiptContainer.amount.information.text = self?.receiptViewModel.amount
                self?.receiptView.receiptContainer.favored.information.text = self?.receiptViewModel.favored
                self?.receiptView.receiptContainer.bank.information.text = self?.receiptViewModel.bank
                self?.receiptView.receiptContainer.date.information.text = self?.receiptViewModel.date
                self?.receiptView.receiptContainer.authentication.information.text = self?.receiptViewModel.authentication
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
        navigationController?.navigationBar.tintColor = .greenMain
    }
    
}
