//
//  ViewModelProtocol.swift
//  DesafioPhi
//
//  Created by Lucas Siqueira on 15/03/21.
//

import Foundation

protocol ViewModelProtocol {
    var reloadData : () -> () { get set }
    var errorMessage : (Error) -> () { get set }
    var requestResult: String { get set }
    
    func getContentData()
}
