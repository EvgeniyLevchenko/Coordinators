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

class MainCoordinator: NSObject, Coordinator {
    weak var parentCoordinator: Coordinator?
    
    var children: [Coordinator] = []
    
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        navigationController.delegate = self
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

extension MainCoordinator: UINavigationControllerDelegate {
    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        guard let fromViewController = navigationController.transitionCoordinator?.viewController(forKey: .from) else { return }
        
        if navigationController.viewControllers.contains(fromViewController) {
            return
        }
        
        if let viewController = fromViewController as? (any Coordinatable),
           let coordinator = viewController.coordinator {
            print("childDidFinish")
            childDidFinish(child: coordinator)
        }
    }
}
