//
//  HomeCoordinator.swift
//  FoodDeliveryApp
//
//  Created by Дарья Балацун on 26.03.24.
//

import UIKit

class HomeCoordinator: Coordinator {
    
    private let factory = SceneFactory.self
    
    override func start() {
        showHomeScene()
    }
    
    override func finish() {
        print("AppCordinator finish")
    }
}
// MARK: - Navigation
extension HomeCoordinator {
    func showHomeScene() {
        guard let navigationController = navigationController else { return }
        let vc = factory.makeHomeScene(coordinator: self)
        navigationController.pushViewController(vc, animated: true)
    }
}
