//
//  OtpScreenView.swift
//  Ticketing App
//
//  Created by nikhil tiwari on 04/04/25.
//

import SwiftUI

struct OtpVerificationView: View {
    @StateObject private var viewModel = SendOtpViewModel()
    @StateObject private var otpTimer = OtpTimerManager()
    @State private var otpInput: String = ""
    @Binding var mobileNumber: String
    @State private var navigateHome = false
    @State private var selectedTab: Tab = .home
    var body: some View {
       // NavigationStack {
        VStack {
            ScrollView {
                VStack {
                    Image("Group 46")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 160, height: 160)
                        .padding(.top)
                    
                    Text("Lucknow Development Authority Park\nTicketing System.")
                        .multilineTextAlignment(.center)
                        .bold()
                        .padding(.vertical)
                    
                    HStack {
                        Text("Enter the OTP sent to")
                        Text(mobileNumber)
                            .bold()
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal)
                    
                    FloatingTextFieldOtp(placeHolder: "Enter OTP", text: $otpInput)
                        .padding(.all)
                    
                    Button(action: {
                        //                        viewModel.mobileNumber = mobileNumber
                        //                        viewModel.verifyOtp(otpInput) { success in
                        //                            if success, let userId = viewModel.otpModel?.userInfo?.userID {
                        //                               // UserDefaults.standard.set(userId, forKey: "userId")
                        //                                UserDefaults.standard.setValue("\(userId)", forKey: "userid")
                        //                                print("✅ Saved userId: \(userId)")
                        //                               //                                                                                                        coordinator.goToContent()
                        //                            } else {
                        //                                print("❌ OTP verification failed or userId is nil")
                        //                            }
                        //                        }
                        viewModel.mobileNumber = mobileNumber
                        
                        viewModel.verifyOtp(otpInput) { success in
                            if success, let userId = viewModel.otpModel?.userInfo?.userID, userId > 0 {
                                UserDefaults.standard.set(true, forKey: "isLoggedIn")
                                // Save user ID and other user info to UserDefaults
                                UserDefaults.standard.setValue("\(userId)", forKey: "userid")
                                if let userInfo = viewModel.otpModel?.userInfo {
                                    UserDefaults.standard.setValue(userInfo.name ?? "", forKey: "name")
                                    UserDefaults.standard.setValue(userInfo.email ?? "", forKey: "userEmail")
                                    UserDefaults.standard.setValue(userInfo.dob ?? "", forKey: "userDob")
                                    UserDefaults.standard.setValue(userInfo.city ?? "", forKey: "userCity")
                                    UserDefaults.standard.setValue(userInfo.gender ?? "", forKey: "userGender")
                                }
                                
                                print("✅ Saved userId: \(userId)")
                                // Optionally navigate to the next screen or fetch dashboard:
                                // coordinator.goToContent()
                                
                            } else {
                                print("❌ OTP verification failed or userId is nil or not valid (> 0)")
                            }
                        }
                        
                        //  coordinator.goToContent()
                    }) {
                        Text("Continue")
                            .font(.system(size: 20))
                            .padding(.vertical, 12)
                            .frame(maxWidth: .infinity)
                            .foregroundColor(.white)
                            .background(Color.black)
                            .cornerRadius(10)
                            .padding()
                    }
                    NavigationLink(
                        destination: ContentView(),
                        isActive: $navigateHome
                    ) {
                        EmptyView()
                    }
                    
                    
                    VStack{
                        if otpTimer.isCountdownRunning {
                            Text("Didn’t receive the OTP ? Retry in \(otpTimer.formattedTime)")
                                .font(.system(size: 14))
                                .padding(.horizontal)
                                .foregroundColor(otpTimer.countdown <= 10 ? .red : .black)
                        } else {
                            Button(action: {
                                otpTimer.startTimer()
                                viewModel.sendOtp { success in
                                    if success {
                                        viewModel.mobileNumber = mobileNumber
                                        viewModel.canResendOTP = true
                                    } else {
                                        viewModel.canResendOTP = false
                                    }
                                }
                            }, label: {
                                Text("Resend OTP")
                                    .font(.system(size: 14))
                                    .bold()
                                    .foregroundColor(Color(hex: 0x707070))
                            })
                            .padding(.horizontal)
                            .disabled(otpTimer.isCountdownRunning)
                        }
                    }.frame(maxWidth: .infinity,maxHeight: .infinity,alignment: .leading)
                    
                    
                }
                .padding(.top, 40)
                .alert(isPresented: $viewModel.isShowingAlert) {
                    Alert(
                        title: Text("Error"),
                        message: Text(viewModel.alertMessage),
                        dismissButton: .default(Text("OK"))
                    )
                }
            }
            
            Spacer()
            VStack {
                Text("By continuing you’ll agree to our")
                    .font(.system(size: 14))
                    .multilineTextAlignment(.center)
                Button(action: {
                    
                }) {
                    Text("Terms of Condition & Privacy Policy")
                        .font(.system(size: 14))
                        .bold()
                }
            }
            .foregroundColor(.gray)
            .padding(.bottom)
        }
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                // coordinator.customBackButton(action: coordinator.goBack, color: .black)
            }
        }
        
   // }
        .onChange(of: viewModel.isOtpVerified) { verified in
            if verified {
              //  coordinator.goToContent()
                navigateHome = true
            }
        }
        .onAppear {
            // Start timer automatically when view appears
            otpTimer.startTimer()
        }
    }
}





