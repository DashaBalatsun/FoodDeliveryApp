//
//  LoginPresenter.swift
//  FoodDeliveryApp
//
//  Created by Дарья Балацун on 2.04.24.
//

import Foundation

protocol LoginViewOutput: AnyObject {
    func loginStart(login: String, password: String)
    func registrationStart()
    func goToFacebookLogin()
    func goToGogleLogin()
    func goToSignIn()
    func goToSignUp()
    func goToForgotPassword()
    func back()
}

class LoginPresenter {
    
    private var coordinator: LoginCoordinator?
    weak var viewInput: LoginViewInput?
    
    init(coordinator: LoginCoordinator, viewInput: LoginViewInput? = nil) {
        self.coordinator = coordinator
        self.viewInput = viewInput
    }
    
}

private extension LoginPresenter {
    func goToMainScreen() {
        coordinator?.finish()
    }
}

extension LoginPresenter: LoginViewOutput {
    func loginStart(login: String, password: String) {
        viewInput?.startLoader()
        if login == "1234" && password == "1234" {
            DispatchQueue.global().asyncAfter(deadline: .now() + 2.0) {
                DispatchQueue.main.async {
                    self.goToMainScreen()
                    self.viewInput?.stopLoader()
                }
            }
        } else {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                self.viewInput?.stopLoader()
            }
        }
    }
    
    func registrationStart() {
        
    }
    
    func goToFacebookLogin() {
        
    }
    
    func goToGogleLogin() {
        
    }
    
    func goToSignIn() {
        coordinator?.showSignInScene()
    }
    
    func goToSignUp() {
        coordinator?.showSignUpScene()
    }
    
    func goToForgotPassword() {
        
    }
    
    func back() {
        
    }
}

