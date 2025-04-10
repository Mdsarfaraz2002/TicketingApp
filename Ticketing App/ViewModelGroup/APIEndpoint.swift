//
//  APIEndpoint.swift
//  Ticketing App
//
//  Created by nikhil tiwari on 05/04/25.
//


import Foundation

enum APIEndpoint {
    case sendOtp(mobile: String)
    case verifyOtp(mobile: String, otp: String)
    case dashboard(userId: String)

    var url: URL? {
        switch self {
        case .sendOtp(let mobile):
            return URL(string: "\(baseUrl)sendOtp?mobile=\(mobile)&os_type=App")
        case .verifyOtp(let mobile, let otp):
            return URL(string: "\(baseUrl)checkOtp?mobile=\(mobile)&otp=\(otp)")
        case .dashboard(let userId):
                   return URL(string: "\(baseUrl)dashboard?userid=\(userId)")
               
        }
    }
}
