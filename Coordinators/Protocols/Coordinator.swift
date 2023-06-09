//
//  Coordinator.swift
//  Coordinators
//
//  Created by QwertY on 21.04.2023.
//

import UIKit

@objc protocol Coordinator: AnyObject {
    var children: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }
    
    func start()
    @objc optional func childDidFinish()
}
