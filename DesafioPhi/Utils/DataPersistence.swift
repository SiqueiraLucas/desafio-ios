//
//  DataPersistence.swift
//  DesafioPhi
//
//  Created by Lucas Siqueira on 14/03/21.
//

import Foundation

class DataPersistence {
    
    //MARK: - Instances
    
    static let shared = DataPersistence ()

    //MARK: - Initializer
    
    private init () {
        if !UserDefaults.standard.bool(forKey: "Initial"){
            saveLocalData(data: true, key: "Initial")
            saveLocalData(data: false, key: "Hidden")
            Preferences.shared.hideBalance = false
        }else{
            Preferences.shared.hideBalance = UserDefaults.standard.bool(forKey: "Hidden")
        }
    }
    
    //MARK: Functions
    
    func requestForLocation () {
       print("Acesso liberado!")
    }
    
    func saveLocalData(data: Any?, key: String){
        UserDefaults.standard.set(data, forKey: key)
    }
    
}
