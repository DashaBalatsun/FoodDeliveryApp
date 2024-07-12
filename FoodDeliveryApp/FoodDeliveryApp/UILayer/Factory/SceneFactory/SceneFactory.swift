//
//  SceneFactory.swift
//  FoodDeliveryApp
//
//  Created by Дарья Балацун on 29.03.24.
//

import UIKit

struct SceneFactory {
    
    // MARK: - Onboarding flow
    static func makeOnboardingFlow(coordinator: AppCoordinator, finishDelegate: CoordinatorFinishDelegate, navigationController: UINavigationController) -> OnboardingCoordinator {
        let onboardingCoordinator = OnboardingCoordinator(type: .onboarding, navigationController: navigationController, finishDelegate: finishDelegate)
        coordinator.addChildoordinator(onboardingCoordinator)
        return onboardingCoordinator
    }
    
    static func makeLoginFlow(coordinator: AppCoordinator, finishDelegate: CoordinatorFinishDelegate, navigationController: UINavigationController) -> LoginCoordinator {
        let loginCoordinator = LoginCoordinator(type: .login, navigationController: navigationController, finishDelegate: finishDelegate)
        coordinator.addChildoordinator(loginCoordinator)
        return loginCoordinator
    }
    
    static func makeOnboardingScene(coordinator: OnboardingCoordinator) -> OnboardingViewController {
        var pages = [OnboardingPartViewController]()
        
        let firstVC = OnboardingPartViewController()
        firstVC.imageToShow = UIImage(resource: .chickenLeg1)
        firstVC.titleText = "Delicious Food"
        firstVC.descriptionText = "Lorem ipsum dolor sit amet, consectetur adipiscing elit."
        firstVC.buttonText = "Next"
        
        let secondVC = OnboardingPartViewController()
        secondVC.imageToShow = UIImage(resource: .shipped1)
        secondVC.titleText = "Fast Shipping"
        secondVC.descriptionText = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Interdum rhoncus nulla."
        secondVC.buttonText = "Next"
        
        let thirdVC = OnboardingPartViewController()
        thirdVC.imageToShow = UIImage(resource: .medal1)
        thirdVC.titleText = "Certificate Food"
        thirdVC.descriptionText = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi ultricies mauris a id."
        thirdVC.buttonText = "Next"
        
        let fourthVC = OnboardingPartViewController()
        fourthVC.imageToShow = UIImage(resource: .creditCard1)
        fourthVC.titleText = "Payment Online"
        fourthVC.descriptionText = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Dui ultricies sit massa."
        fourthVC.buttonText = "Cool!"
        
        pages.append(firstVC)
        pages.append(secondVC)
        pages.append(thirdVC)
        pages.append(fourthVC)
        
        let presenter = OnboardingViewPresenter(coordinator: coordinator)
        let vc = OnboardingViewController(pages: pages, viewOutput: presenter)
        
        return vc
    }
    
    // MARK: - Main flow
    static func makeMainFlow(coordinator: AppCoordinator, finishDelegate: CoordinatorFinishDelegate) -> TabBarController {
        let homeNavigationController = UINavigationController()
        let homeCoordinator = HomeCoordinator(type: .home, navigationController: homeNavigationController)
        homeNavigationController.tabBarItem = UITabBarItem(title: "Home", image: UIImage(resource: .home), tag: 0)
        homeCoordinator.finishDelegate = finishDelegate
        homeCoordinator.start()
        
        let orderNavigationController = UINavigationController()
        let orderCoordinator = OrderCoordinator(type: .order, navigationController: orderNavigationController)
        orderNavigationController.tabBarItem = UITabBarItem(title: "Order", image: UIImage(resource: .order), tag: 1)
        orderCoordinator.finishDelegate = finishDelegate
        orderCoordinator.start()
        
        let myListNavigationController = UINavigationController()
        let myListCoordinator = MyListCoordinator(type: .list, navigationController: myListNavigationController)
        myListNavigationController.tabBarItem = UITabBarItem(title: "MyList", image: UIImage(resource: .myList), tag: 2)
        myListCoordinator.finishDelegate = finishDelegate
        myListCoordinator.start()
        
        let profileNavigationController = UINavigationController()
        let profileCoordinator = ProfileCoordinator(type: .profile, navigationController: profileNavigationController)
        profileNavigationController.tabBarItem = UITabBarItem(title: "Profile", image: UIImage(resource: .settings), tag: 3)
        profileCoordinator.finishDelegate = finishDelegate
        profileCoordinator.start()
        
        coordinator.addChildoordinator(homeCoordinator)
        coordinator.addChildoordinator(orderCoordinator)
        coordinator.addChildoordinator(myListCoordinator)
        coordinator.addChildoordinator(profileCoordinator)
        
        let tabBarContollers = [homeNavigationController, orderNavigationController, myListNavigationController, profileNavigationController]
        let tabBarController = TabBarController(tabBarControllers: tabBarContollers)
        
        return tabBarController
    }
    
    static func makeAuthScene(coordinator: LoginCoordinator) -> LoginViewController {
        let presenter = LoginPresenter(coordinator: coordinator)
        let controller = LoginViewController(viewOutput: presenter, state: .initial)
        presenter.viewInput = controller
        return controller
    }
    
    static func makeSignInScene(coordinator: LoginCoordinator) -> LoginViewController {
        let presenter = LoginPresenter(coordinator: coordinator)
        let controller = LoginViewController(viewOutput: presenter, state: .signIn)
        presenter.viewInput = controller
        return controller
    }
    
    static func makeSignUpScene(coordinator: LoginCoordinator) -> LoginViewController {
        let presenter = LoginPresenter(coordinator: coordinator)
        let controller = LoginViewController(viewOutput: presenter, state: .signUp )
        presenter.viewInput = controller
        return controller
    }
    
    static func makeHomeScene(coordinator: HomeCoordinator) -> HomeViewController  {
        let controller = HomeViewController()
        return controller
    }
}

