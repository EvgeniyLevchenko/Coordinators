//
//  MainCoordinator.swift
//  Coordinators
//
//  Created by QwertY on 21.04.2023.
//

import UIKit

enum FlowDirections {
    case buy
    case accountCreation
}

class MainCoordinator: Coordinator {
    weak var parentCoordinator: Coordinator?
    
    var children: [Coordinator] = []
    
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let viewController = MainViewController()
        viewController.coordinator = self
        navigationController.pushViewController(viewController, animated: true)
    }
    
    private func switchToBuyFlow() {
        let child = BuyCoordinator(navigationController: navigationController)
        children.append(child)
        child.start()
    }
    
    private func switchToCreateAccountFlow() {
        let child = CreateAccountCoordinator(navigationController: navigationController)
        children.append(child)
        child.start()
    }
    
    func switchFlow(to flow: FlowDirections) {
        switch flow {
        case .buy:
            switchToBuyFlow()
        case .accountCreation:
            switchToCreateAccountFlow()
        }
    }
    
    func childDidFinish(child: Coordinator) {
        for (index, coordinator) in children.enumerated() {
            if coordinator === child {
                children.remove(at: index)
                break
            }
        }
    }
}
