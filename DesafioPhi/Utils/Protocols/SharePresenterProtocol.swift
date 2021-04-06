//
//  SharePresenterProtocol.swift
//  DesafioPhi
//
//  Created by Lucas Siqueira on 16/03/21.
//

import Foundation
import UIKit

protocol SharePresenterProtocol {
    func presentShare(on viewController: UIViewController, completion: @escaping () -> Void)
    
}
