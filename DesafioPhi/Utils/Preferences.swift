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
    var hideBalance = false
    
    //MARK: Initializer
    
    private init () {}
    

    //MARK: Function
    
    func requestForLocation () {
        print("Acesso liberado!")
    }
}
