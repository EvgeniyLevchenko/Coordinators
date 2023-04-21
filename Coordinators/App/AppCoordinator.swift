//
//  AppCoordinator.swift
//  Coordinators
//
//  Created by QwertY on 21.04.2023.
//

import UIKit

class AppCoordinator: Coordinator {
    var children: [Coordinator] = []
    
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let child = MainCoordinator(navigationController: navigationController)
        children.append(child)
        child.start()
    }
}
