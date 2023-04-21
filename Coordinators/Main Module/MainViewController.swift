//
//  ViewController.swift
//  Coordinators
//
//  Created by QwertY on 21.04.2023.
//

import UIKit

class MainViewController: UIViewController {
    
    weak var coordinator: MainCoordinator?
    
    private var buyButton: UIButton = {
        let button = UIButton()
        button.setTitle("Buy", for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 10
        return button
    }()
    
    private var createAccountButton: UIButton = {
        let button = UIButton()
        button.setTitle("Create an account", for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 10
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView() {
        view.backgroundColor = .white
        setupLayout()
        setButtonTargets()
    }
    
    private func setButtonTargets() {
        buyButton.addTarget(self, action: #selector(buyTapped), for: .touchUpInside)
        createAccountButton.addTarget(self, action: #selector(createAccountTapped), for: .touchUpInside)
    }
    
    @objc private func buyTapped() {
        coordinator?.switchFlow(to: .buy)
        print("buy")
    }
    
    @objc private func createAccountTapped() {
        coordinator?.switchFlow(to: .accountCreation)
        print("create")
    }
}

// MARK: - Setup Layout
extension MainViewController {
    private func setupLayout() {
        let stackView = UIStackView(arrangedSubviews: [buyButton, createAccountButton])
        stackView.alignment = .center
        stackView.axis = .horizontal
        stackView.spacing = 20
        stackView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            buyButton.heightAnchor.constraint(equalToConstant: 60.0),
            buyButton.widthAnchor.constraint(equalToConstant: self.view.bounds.width / 2.0 - 20),
            createAccountButton.heightAnchor.constraint(equalToConstant: 60.0),
            createAccountButton.widthAnchor.constraint(equalToConstant: self.view.bounds.width / 2 - 20)
        ])
        
        NSLayoutConstraint.activate([
            stackView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            stackView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
        ])
    }
}

