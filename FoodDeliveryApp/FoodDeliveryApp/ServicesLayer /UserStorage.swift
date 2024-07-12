//
//  UserStorage.swift
//  FoodDeliveryApp
//
//  Created by Дарья Балацун on 28.03.24.
//

import Foundation

class UserStorage {
    
    static let shared = UserStorage()
    
    var passedOnboarding: Bool {
        get { UserDefaults.standard.bool(forKey: "passedOnboarding") }
        set { UserDefaults.standard.set(newValue,  forKey: "passedOnboarding") }
    }
}
