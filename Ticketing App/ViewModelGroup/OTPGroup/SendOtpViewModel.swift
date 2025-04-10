//
//  SendOtpViewModel.swift
//  Ticketing App
//
//  Created by nikhil tiwari on 05/04/25.
//

import Foundation

class SendOtpViewModel: ObservableObject {
    @Published var alertMessage = ""
    @Published var isShowingAlert = false
    @Published var otpModel: OTPModel?
    @Published var mobileNumber = ""
    @Published var isOtpVerified = false

    func sendOtp(completion: @escaping (Bool) -> Void) {
        let url = APIEndpoint.sendOtp(mobile: mobileNumber).url
        print("📡 Sending OTP - API URL: \(url)")

        APIService.shared.request(from: .sendOtp(mobile: mobileNumber), responseType: OTPModel.self) { [weak self] result in
            switch result {
            case .success(let response):
                print("✅ OTPModel Response: \(response)") // 🧾 Log decoded response
                if response.status {
                    self?.otpModel = response
                    completion(true)
                } else {
                    self?.showAlert(message: response.message)
                    completion(false)
                }
            case .failure(let error):
                print("❌ API Error: \(error.localizedDescription)")
                self?.showAlert(message: error.localizedDescription)
                completion(false)
            }
        }
    }


    func verifyOtp(_ otp: String) {
        let url = APIEndpoint.verifyOtp(mobile: mobileNumber, otp: otp).url
        print("Verify OTP API URL: \(url)")  // ✅ Print the full URL

        APIService.shared.request(from: .verifyOtp(mobile: mobileNumber, otp: otp), responseType: OTPModel.self) { [weak self] result in
            switch result {
            case .success(let response):
                print("✅ OTPModel Response: \(response)")
                if response.status {
                    self?.isOtpVerified = true
                } else {
                    self?.showAlert(message: response.message)
                }
            case .failure(let error):
                print("❌ API Error: \(error.localizedDescription)")
                self?.showAlert(message: error.localizedDescription)
            }
        }
    }


    private func showAlert(message: String) {
        alertMessage = message
        isShowingAlert = true
    }
}
