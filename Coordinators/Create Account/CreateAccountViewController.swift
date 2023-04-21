//
//  CreateAccountViewController.swift
//  Coordinators
//
//  Created by QwertY on 21.04.2023.
//

import UIKit

class CreateAccountViewController: UIViewController {
    
    weak var coordinator: CreateAccountCoordinator?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        coordinator?.accountCreationFinished()
    }
}
