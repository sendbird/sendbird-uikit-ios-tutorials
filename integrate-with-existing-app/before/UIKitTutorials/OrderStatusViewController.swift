//
//  OrderStatusViewController.swift
//  UIKitTutorials
//
//  Created by Jerry Jeon on 5/5/24.
//

import Foundation
import UIKit

class OrderStatusViewController: UIViewController {
    lazy private var orderNumberLabel: UILabel = {
        let label = UILabel()
        label.text = orderDetails.orderNumber
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.textAlignment = .center
        return label
    }()
    
    lazy private var orderItemsLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.textAlignment = .center
        return label
    }()
    
    lazy private var orderStatusLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.textColor = .systemGreen
        label.textAlignment = .center
        return label
    }()
    
    lazy private var chatButton: UIButton = {
        let button = UIButton()
        button.setTitle("Chat with delivery person", for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 20
        button.addTarget(self, action: #selector(chatButtonTapped), for: .touchUpInside)
        return button
    }()
    
    lazy private var stackView: UIStackView = {
        let stackView = UIStackView(
            arrangedSubviews: [
                orderNumberLabel,
                orderItemsLabel,
                orderStatusLabel,
                chatButton
            ]
        )
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    let orderDetails = OrderDetails(
        orderNumber: "Order #12345",
        items: ["Pizza", "Coke"],
        status: "In transit",
        deliveryPersonId: "YOUR_DELIVERY_PERSON_ID"   // TODO: Replace with actual delivery person ID
    )
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        orderItemsLabel.text = orderDetails.items.joined(separator: ", ")
        orderStatusLabel.text = "Status: " + orderDetails.status
        
        view.addSubview(stackView)
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            chatButton.heightAnchor.constraint(equalToConstant: 44),
            chatButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8)
        ])
    }
    
    @objc private func chatButtonTapped() {
        // Sendbird's GroupChannelViewController will be shown up
    }
}

