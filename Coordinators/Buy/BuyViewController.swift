//
//  BuyViewController.swift
//  Coordinators
//
//  Created by QwertY on 21.04.2023.
//

import UIKit

class BuyViewController: UIViewController, Coordinatable {
    
    weak var coordinator: BuyCoordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        print("Let's buy something!")
    }
}
