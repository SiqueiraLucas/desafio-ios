//
//  ViewController.swift
//  DesafioPhi
//
//  Created by Lucas Siqueira on 11/03/21.
//

import UIKit

class ExtractViewController: UIViewController {
    
    //MARK: Instances
    
    let extractView = ExtractView(frame: UIScreen.main.bounds)
    let balanceViewModel = BalanceViewModel(balance: BalanceModel())
    let extractViewModel = ExtractViewModel(extracts: [Item]())
    
    //MARK: Life Cycle
    
    override func loadView() {
        self.view = extractView
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
    
    @objc func eyeButtonAction(sender: UIButton!) {
        balanceViewModel.hiddenAmount()
    }

}

//MARK: Protocol Setup

extension ExtractViewController: ViewControllerProtocol{
    
    func additionalSetup() {
        self.title = "Extrato"
        tableViewSetup()
    }
    
    func targetsSetup() {
        extractView.balanceView.eyeButton.addTarget(self, action: #selector(eyeButtonAction), for: .touchUpInside)
    }
    
    func closureSetup()  {
        balanceViewModel.reloadData = { [weak self] ()  in
            DispatchQueue.main.async {
                self?.extractView.balanceView.balanceLabel.text = self?.balanceViewModel.amount
                self?.extractView.balanceView.eyeButton.setImage(self?.balanceViewModel.eyeImage, for: .normal)
            }
        }
        balanceViewModel.errorMessage = { (error)  in
            DispatchQueue.main.async {
                print("Error: \(error)")
            }
        }
        extractViewModel.reloadData = { [weak self] ()  in
            DispatchQueue.main.async {
                self?.extractView.tableView.reloadData()
            }
        }
        extractViewModel.errorMessage = { (error)  in
            DispatchQueue.main.async {
                print("Error: \(error)")
            }
        }
    }
    
    func getContentSetup(){
        balanceViewModel.reloadData()
        balanceViewModel.getContentData()
        extractViewModel.getContentData()
    }
    
    func navigationControllerSetup(){
        navigationController?.navigationBar.barTintColor = .white
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        navigationController?.navigationBar.shadowImage = UIImage()
    }
}

