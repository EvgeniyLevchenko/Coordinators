//
//  BuyCoordinator.swift
//  Coordinators
//
//  Created by QwertY on 21.04.2023.
//

import UIKit

class BuyCoordinator: Coordinator {
    weak var parentCoordinator: MainCoordinator?
    
    var children: [Coordinator] = []
    
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let viewController = BuyViewController()
        viewController.coordinator = self
        navigationController.pushViewController(viewController, animated: true)
    }
}
