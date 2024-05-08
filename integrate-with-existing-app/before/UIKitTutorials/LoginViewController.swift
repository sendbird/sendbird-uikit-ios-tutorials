//
//  LoginViewController.swift
//  UIKitTutorials
//
//  Created by Jerry Jeon on 2024/04/28.
//

import Foundation
import UIKit

class LoginViewController: UIViewController {
    
    lazy private var userIdTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter your user ID"
        textField.borderStyle = .roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    lazy private var loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Login", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupViews()
    }
    
    private func setupViews() {
        view.addSubview(userIdTextField)
        view.addSubview(loginButton)
        
        NSLayoutConstraint.activate([
            userIdTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            userIdTextField.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            userIdTextField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),
            
            loginButton.topAnchor.constraint(equalTo: userIdTextField.bottomAnchor, constant: 20),
            loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    @objc private func loginButtonTapped() {
        let orderStatusVC = OrderStatusViewController()
        navigationController?.pushViewController(orderStatusVC, animated: true)
    }
}
