//
//  SendOtpModel.swift
//  Ticketing App
//
//  Created by nikhil tiwari on 05/04/25.
//

import Foundation


struct User {
    var id: String
    var phoneNumber: String
}

struct OTPModel: Decodable {
    var status: Bool
    var message: String
    var userInfo: UserInfo?
}

struct UserInfo: Codable {
    var userID: Int
    var name: String?
    var email: String?
    var gender: String?
    var dob: String?
    var city: String?
    var mobile: String?
    
}

struct OTPRequest {
    var phoneNumber: String
    var otp: String
}


