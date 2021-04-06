//
//  SceneDelegate.swift
//  DesafioPhi
//
//  Created by Lucas Siqueira on 11/03/21.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        if let windowScene = scene as? UIWindowScene {

            let window = UIWindow(windowScene: windowScene)
            let firstViewController = ExtractViewController()
            let navigation = UINavigationController(rootViewController: firstViewController)
            window.rootViewController = navigation
            
            self.window = window
            window.makeKeyAndVisible()
        }
    }

}

