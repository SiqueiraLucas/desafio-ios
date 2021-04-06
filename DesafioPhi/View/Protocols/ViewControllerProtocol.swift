//
//  ViewControllerProtocol.swift
//  DesafioPhi
//
//  Created by Lucas Siqueira on 15/03/21.
//

import Foundation

protocol ViewControllerProtocol {
    func setup()
    func closureSetup()
    func getContentSetup()
    func navigationControllerSetup()
    func targetsSetup()
    func additionalSetup()
}

extension ViewControllerProtocol{
    func setup(){
        closureSetup()
        getContentSetup()
        targetsSetup()
        additionalSetup()
    }
}
