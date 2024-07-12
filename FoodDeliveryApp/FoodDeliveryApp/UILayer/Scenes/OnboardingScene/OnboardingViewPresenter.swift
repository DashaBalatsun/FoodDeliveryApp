//
//  OnboardingViewPresenter.swift
//  FoodDeliveryApp
//
//  Created by Дарья Балацун on 27.03.24.
//

import UIKit

protocol OnboardingViewOutput: AnyObject {
    func onboardingFinish()
}

class OnboardingViewPresenter: OnboardingViewOutput {
    
    // MARK: - Properties
    weak var coordinator: OnboardingCoordinator!
    private let userStorage = UserStorage.shared
    
    init(coordinator: OnboardingCoordinator!) {
        self.coordinator = coordinator
    }
    
    func onboardingFinish() {
        userStorage.passedOnboarding = true
        coordinator.finish()
    }
}
