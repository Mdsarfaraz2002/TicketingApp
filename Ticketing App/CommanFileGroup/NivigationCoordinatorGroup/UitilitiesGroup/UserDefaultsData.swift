//
//  UserDefaultsData.swift
//  Ticketing App
//
//  Created by Mohd Sarfaraz  on 08/04/25.
//

import Foundation

class UserDefaultsData {
    static func saveUserStrId(_ userId: String) {
        UserDefaults.standard.set(userId, forKey: "userid")
    }
    
    static func getUserStrId() -> String? {
        return UserDefaults.standard.string(forKey: "userid")
    }
    
    
    static func getUserName() -> String? {
        
        return UserDefaults.standard.string(forKey: "name")
        
    }
    
    
    static func getUserEmail() -> String? {
        
        return UserDefaults.standard.string(forKey: "userEmail")
        
        
    }
    
    static func getUserGender() -> String? {
        
        return UserDefaults.standard.string(forKey: "userGender")
        
    }
    
    static func getUserDob() -> String? {
        
        return UserDefaults.standard.string(forKey: "userDob")
        
    }
    static func getUserCity() -> String? {
        
        return UserDefaults.standard.string(forKey: "userCity")
        
    }
}
