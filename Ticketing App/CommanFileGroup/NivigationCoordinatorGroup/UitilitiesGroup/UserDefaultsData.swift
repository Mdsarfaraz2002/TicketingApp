//
//  UserDefaultsData.swift
//  Ticketing App
//
//  Created by nikhil tiwari on 08/04/25.
//

import Foundation

//class UserDefaultsData {
//    
//    // MARK: - Save Methods
//    static func saveUserStrId(_ userId: String) {
//        UserDefaults.standard.set(userId, forKey: "userid")
//    }
//    static func saveUserIntId(_ userId: Int) {
//        UserDefaults.standard.set(userId, forKey: "userid")
//    }
//    
//    static func saveUserName(_ name: String) {
//        UserDefaults.standard.set(name, forKey: "name")
//    }
//
//    static func saveUserEmail(_ email: String) {
//        UserDefaults.standard.set(email, forKey: "userEmail")
//    }
//
//    static func saveUserGender(_ gender: String) {
//        UserDefaults.standard.set(gender, forKey: "userGender")
//    }
//
//    static func saveUserDob(_ dob: String) {
//        UserDefaults.standard.set(dob, forKey: "userDob")
//    }
//
//    static func saveUserCity(_ city: String) {
//        UserDefaults.standard.set(city, forKey: "userCity")
//    }
//
//    // MARK: - Get Methods
//    static func getUserStrId() -> String? {
//        return UserDefaults.standard.string(forKey: "userid")
//    }
//    static func getUserIntId() -> Int? {
//        return UserDefaults.standard.integer(forKey: "userid")
//    }
//    
//    static func getUserName() -> String? {
//        return UserDefaults.standard.string(forKey: "name")
//    }
//
//    static func getUserEmail() -> String? {
//        return UserDefaults.standard.string(forKey: "userEmail")
//    }
//
//    static func getUserGender() -> String? {
//        return UserDefaults.standard.string(forKey: "userGender")
//    }
//
//    static func getUserDob() -> String? {
//        return UserDefaults.standard.string(forKey: "userDob")
//    }
//
//    static func getUserCity() -> String? {
//        return UserDefaults.standard.string(forKey: "userCity")
//    }
//}


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
