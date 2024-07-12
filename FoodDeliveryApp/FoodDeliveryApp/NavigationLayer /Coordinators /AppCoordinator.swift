//
//  AppCoordinator.swift
//  FoodDeliveryApp
//
//  Created by Дарья Балацун on 25.03.24.
//

import UIKit

class AppCoordinator: Coordinator {
    
    private let userStorage = UserStorage.shared
    private let factory = SceneFactory.self
    
    var tabBarController: UITabBarController?
    
    override func start() {
        if userStorage.passedOnboarding {
            showAuthFlow()
        } else {
            showOnboardingFlow()
        }
//        showMainFlow()
    }
    
    override func finish() {
        print("AppCordinator finish")
    }
}
// MARK: - Navigation methods
private extension AppCoordinator {
    func showOnboardingFlow() {
        guard let navigationController = navigationController else { return }
        let onboardingCoordinator = factory.makeOnboardingFlow(coordinator: self, finishDelegate: self, navigationController: navigationController )
        onboardingCoordinator.start()
    }
    
    func showMainFlow() {
        guard let navigationController = navigationController else { return }
        let tabBarController = factory.makeMainFlow(coordinator: self, finishDelegate: self)
        self.tabBarController = tabBarController
        let transition = CATransition()
        transition.duration = 0.3
        transition.type = .fade
        self.window?.layer.add(transition, forKey: kCATransition)
        self.window?.rootViewController = self.tabBarController
    }
    
    func showAuthFlow() {
        guard let navigationController = navigationController else { return }
        let loginCoordinator = factory.makeLoginFlow(coordinator: self, finishDelegate: self, navigationController: navigationController)
        loginCoordinator.start()
    }
}
// MARK: - В методе coordinatorDidFinish(childCoordinator:) происходит удаление завершившегося дочернего координатора из списка дочерних координаторов текущего координатора.
//Если тип завершившегося координатора равен .app, это означает, что завершился сам AppCoordinator, поэтому ничего не делается.
//В остальных случаях навигация возвращается к корневому контроллеру текущего координатора.
extension AppCoordinator: CoordinatorFinishDelegate {
    func coordinatorDidFinish(childCoordinator: CoordinatorProtocol) {
        removeChildCoordinator(childCoordinator)
        
        switch childCoordinator.type {
        case .onboarding:
            showAuthFlow()
            navigationController?.viewControllers = [navigationController?.viewControllers.last ?? UIViewController()]
        case .login:
            showMainFlow()
            navigationController?.viewControllers = [navigationController?.viewControllers.last ?? UIViewController()]
        case .app:
            return
        default:
            navigationController?.popToRootViewController(animated: false)
        }
    }
}

//Таким образом, делегат позволяет родительскому координатору реагировать на события, происходящие в его дочерних координаторах, и управлять логикой навигации или выполнением других действий в зависимости от этого.
