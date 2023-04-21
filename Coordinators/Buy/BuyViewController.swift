//
//  BuyViewController.swift
//  Coordinators
//
//  Created by QwertY on 21.04.2023.
//

import UIKit

class BuyViewController: UIViewController {
    
    weak var coordinator: BuyCoordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        coordinator?.buyFinished()
    }
}
