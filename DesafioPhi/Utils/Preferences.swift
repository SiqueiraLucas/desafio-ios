//
//  Preferences.swift
//  DesafioPhi
//
//  Created by Lucas Siqueira on 14/03/21.
//

import Foundation

class Preferences{
    
    //MARK: - Instances
    
    static let shared = Preferences()
    
    lazy var hideBalance: Bool = false{
        didSet{
            UserDefaults.standard.setValue(hideBalance, forKey: "Hidden")
        }
    }
    
    //MARK: Initializer
    
    private init () {
        if !UserDefaults.standard.bool(forKey: "Init"){
            UserDefaults.standard.setValue(true, forKey: "Init")
            hideBalance = false
        }else{
            hideBalance = UserDefaults.standard.bool(forKey: "Hidden")
        }
    }
    
}
