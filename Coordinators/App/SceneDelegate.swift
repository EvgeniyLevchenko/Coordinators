//
//  SceneDelegate.swift
//  Coordinators
//
//  Created by QwertY on 21.04.2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var coordinator: AppCoordinator?
    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        let navigationController = UINavigationController()
        coordinator = AppCoordinator(navigationController: navigationController)
        coordinator?.start()
        
        let window = UIWindow(windowScene: windowScene)
        self.window = window
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
}

