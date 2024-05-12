//
//  OrderStatusViewController.swift
//  UIKitTutorials
//
//  Created by Jerry Jeon on 5/5/24.
//

import Foundation
import UIKit
import SendbirdUIKit
import SendbirdChatSDK

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
        deliveryPersonId: "Eric"   // TODO: Replace with actual delivery person ID
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
        // 1. Connect to Sendbird server.
        SendbirdUI.connect { user, error in
            if let user = user {
                // 2. Create a group channel between the user and the delivery person.
                let params = GroupChannelCreateParams()
                params.addUserIds([user.id, self.orderDetails.deliveryPersonId])
                params.isDistinct = true  // Reuse the channel if it already exists
                GroupChannel.createChannel(params: params) { (channel, error) in
                    guard let channel = channel, error == nil else {
                        print("Error creating a channel:", error?.localizedDescription ?? "unknown error")
                        return
                    }
                    
                    // 3. Open the channel by pushing `SBUGroupChannelViewController`.
                    let chattingVC = SBUGroupChannelViewController(channel: channel)
                    self.navigationController?.pushViewController(chattingVC, animated: true)
                }
            }
        }
    }
}

