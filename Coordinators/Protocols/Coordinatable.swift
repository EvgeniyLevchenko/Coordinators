//
//  Coordinatable.swift
//  Coordinators
//
//  Created by QwertY on 21.04.2023.
//

import Foundation

protocol Coordinatable {
    associatedtype AnyCoodinator: Coordinator
    var coordinator: AnyCoodinator? { get set }
}
