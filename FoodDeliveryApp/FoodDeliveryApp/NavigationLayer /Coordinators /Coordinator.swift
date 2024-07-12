//
//  Coordinator.swift
//  FoodDeliveryApp
//
//  Created by Дарья Балацун on 25.03.24.
//

import UIKit

enum CoordinatorType {
    case app
    case onboarding
    case login
    case home
    case order
    case list
    case profile
}
                            

protocol CoordinatorProtocol: AnyObject {
    var childCoordinators: [CoordinatorProtocol] { get set }
    var type: CoordinatorType { get }
    var navigationController: UINavigationController? { get set }
    var finishDelegate: CoordinatorFinishDelegate? { get set }
    
    func start()
    func finish()
}

extension CoordinatorProtocol {
    func addChildoordinator(_ childCoordinator: CoordinatorProtocol) {
        childCoordinators.append(childCoordinator)
    }
    func removeChildCoordinator(_ childCoordinator: CoordinatorProtocol) {
        childCoordinators = childCoordinators.filter{ $0 !== childCoordinator }
    }
}
// MARK: - Delegation
protocol CoordinatorFinishDelegate: AnyObject {
    func coordinatorDidFinish(childCoordinator: CoordinatorProtocol)
}

protocol TavBarCoordinator: AnyObject, CoordinatorProtocol {
    var tabBarControoler: UITabBarController? { get set }
}

class Coordinator: CoordinatorProtocol {
    var childCoordinators: [CoordinatorProtocol]
    var type: CoordinatorType
    var navigationController: UINavigationController?
    var window: UIWindow?
    weak var finishDelegate: CoordinatorFinishDelegate?
    
    init(childCoordinators: [CoordinatorProtocol] = [CoordinatorProtocol](), type: CoordinatorType, navigationController: UINavigationController?, finishDelegate: CoordinatorFinishDelegate? = nil, window: UIWindow? = nil) {
        self.childCoordinators = childCoordinators
        self.type = type
        self.navigationController = navigationController
        self.finishDelegate = finishDelegate
        self.window = window 
    }
    
    deinit {
        print()
        childCoordinators.forEach { $0.finishDelegate = nil }
        childCoordinators.removeAll()
    }
    
    func start() {
        print()
    }
    
    func finish() {
        print()
    }
    
    
}
