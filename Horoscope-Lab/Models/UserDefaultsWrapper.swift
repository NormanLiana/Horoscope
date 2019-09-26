//
//  UserDefaultsWrapper.swift
//  Horoscope-Lab
//
//  Created by Liana Norman on 9/26/19.
//  Copyright © 2019 Liana Norman. All rights reserved.
//

import Foundation

class UserDefaultsWrapper {
    
    // MARK: Singleton
    static let standard = UserDefaultsWrapper()
    
    // MARK: Private Keys
    private let usernameKey = "username"
    private let userSignKey = "sign"
    
    // MARK: Getters
    func getUsername() -> String? {
       return UserDefaults.standard.value(forKey: usernameKey) as? String
    }
    
    func getUserSign() -> String? {
        return UserDefaults.standard.value(forKey: userSignKey) as? String
    }
    
    // MARK: Setters
    func store(userName: String) {
        UserDefaults.standard.set(userName, forKey: usernameKey)
    }
    
    func store(userSign: String) {
        UserDefaults.standard.set(userSign, forKey: userSignKey)
    }
    
}
