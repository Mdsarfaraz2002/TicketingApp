//
//  OtpScreenView.swift
//  Ticketing App
//
//  Created by nikhil tiwari on 04/04/25.
//

import SwiftUI
import Alamofire

struct OtpScreenView: View {
    @EnvironmentObject var coordinator: AppCoordinator
    @State private var mobileOtp: String = ""
    @Binding var mobileNumber: String
    var body: some View {
            VStack{
            ScrollView{
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
                    HStack{
                        Text("Enter the OTP sent to")
                        Text(mobileNumber ?? "")
                            .bold()
                    }.frame(maxWidth: .infinity,maxHeight: .infinity,alignment: .leading)
                        .padding(.horizontal)
                    FloatingTextFieldOtp(placeHolder: "Enter OTP", text: $mobileOtp)
                        .padding(.all)
                    
                    Button(action : {
                        coordinator.goToDashboard()
                    }){
                        Text("Continue")
                            .font(.system(size: 20))
                            .padding(.vertical,12)
                            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                            .foregroundColor(Color(hex: 0xFFFFFF))
                            .background(Color(hex: 0x000000))
                            .cornerRadius(10)
                            .padding(.all)
                        
                    }
                    
                    
                }.padding(.top,40)
            }
               
            Spacer()
            VStack {
                Text("By continuing you’ll agree to our")
                    .font(.system(size: 14))
                    .multilineTextAlignment(.center)
                Button(action:{
                    
                }){
                    Text("Terms of Condition & Privacy Policy")
                        .font(.system(size: 14))
                        .multilineTextAlignment(.center)
                        .bold()
                }
            }
            .foregroundColor(.gray)
            .padding(.bottom) // Adds spacing from bottom
        }
            .navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    coordinator.customBackButton(action: coordinator.goBack, color: .black)
                }
            }

            .navigationDestination(for: String.self) { destination in
                if destination == "DashboardView" {
                    DashboardView()
                }
            }
        
        
    }
}
