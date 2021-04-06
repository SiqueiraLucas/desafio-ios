//
//  SharePresenterMock.swift
//  DesafioPhiTests
//
//  Created by Lucas Siqueira on 16/03/21.
//

import Foundation
import UIKit
@testable import DesafioPhi

class SharePresenterMock: SharePresenterProtocol {
    
    var presentCalled = false
    var viewController: UIViewController?
    
    func presentShare(on viewController: UIViewController, completion: @escaping () -> Void) {
        presentCalled = true
        self.viewController = viewController
    }
    
}
