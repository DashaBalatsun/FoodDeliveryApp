//
//  OrderCoordinator.swift
//  FoodDeliveryApp
//
//  Created by Дарья Балацун on 26.03.24.
//

import UIKit

class OrderCoordinator: Coordinator {
    
    override func start() {
        let vc = ViewController()
        vc.view.backgroundColor = .yellow
        navigationController?.pushViewController(vc, animated: true)
    }
    
    override func finish() {
        print("AppCordinator finish")
    }
}

