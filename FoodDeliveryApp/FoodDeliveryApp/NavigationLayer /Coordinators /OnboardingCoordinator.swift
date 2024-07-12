//
//  OnboardingCoordinator.swift
//  FoodDeliveryApp
//
//  Created by Дарья Балацун on 25.03.24.
//

import UIKit

// MARK: - OnboardingCoordinator
class OnboardingCoordinator: Coordinator {
    
    // MARK: - Properties
    private let factory = SceneFactory.self
    
    // MARK: - Methods
    override func start() {
        showOnboarding()
    }
    
    override func finish() {
        finishDelegate?.coordinatorDidFinish(childCoordinator: self)
    }
}

// MARK: - Navigation
private extension OnboardingCoordinator {
    func showOnboarding() {
        let vc = factory.makeOnboardingScene(coordinator: self)
        navigationController?.pushViewController(vc, animated: true)
    }
}
