//
//  SideMenuView.swift
//  Ticketing App
//
//  Created by nikhil tiwari on 08/04/25.
//




import SwiftUI

struct SideMenuView: View {
    @Binding var isShowing: Bool
    @Binding var isLoggedIn: Bool // Binding to control the login state
    @State private var selectedOption: SideMenuOptionDataMedel?
    @State private var myTicketBtn = false
    @State private var deleteAccountBtn = false
    @State private var userProfileBtn = false
    @State private var showLogoutAlert = false
    @State private var logoutBtn = false
    @State private var showProgress = false
    @State private var RtdcPolicyBtn = false
    @Environment(\.dismiss) var dismiss
    // @State  var selectDate: String
    //var userInfo: UserInfo?
    
    var body: some View {
        ZStack {
            if isShowing {
                Rectangle()
                    .opacity(0.3)
                    .ignoresSafeArea()
                    .onTapGesture {
                        isShowing.toggle()
                    }
                
                HStack {
                    VStack(alignment: .leading, spacing: 32) {
                        //                        Text("Menu")
                        //                            .bold()
                        //                            .frame(maxWidth: .infinity, alignment: .center)
                        //                           // .background(Color.)
                        
                        //                        Divider()
                        //                            .padding(.horizontal)
                        
                        
                        VStack {
                            ForEach(SideMenuOptionDataMedel.allCases) { option in
                                Button(action: {
                                    selectedOption = option
                                    if option == .DownloadTicket {
                                        myTicketBtn.toggle()
                                    }
                                    if option == .profile {
                                        userProfileBtn.toggle()
                                    }
                                    if option == .logout {
                                        showLogoutAlert = true
                                    }
                                    if option == .RtdcPolicy {
                                        RtdcPolicyBtn = true
                                    }
                                    
                                }, label: {
                                    SideMenuRowView(option: option, selectedOption: $selectedOption)
                                })
                            }
                        }
                        Spacer()
                    }
                    .padding(.top, 140)
                    .frame(width: 270, height: 870)
                    .background(Color.white)
                    Spacer()
                }
                .transition(.move(edge: .leading))
                
                // Logout Confirmation Alert
                
                .alert(isPresented: $showLogoutAlert) {
                    Alert(
                        title: Text("Confirm Logout"),
                        message: Text("Are you sure you want to logout?"),
                        primaryButton: .destructive(Text("Logout")) {
                            showProgress = true
                            // isShowing.toggle()
                            logout()
                            logoutBtn.toggle()
                            
                            
                            
                            
                        },
                        secondaryButton: .cancel()
                    )
                }
                
                // Show Progress View when logging out
                if showProgress {
                    ProgressView("Logging out...")
                        .foregroundColor(.white)
                        .padding()
                        .tint(.white)
                }
                
                
                
                
            }
        }
        .animation(.easeInOut, value: isShowing)
        //        .fullScreenCover(isPresented: $myTicketBtn) {
        //            MyTicketsView(route: TicketRoute())
        //        }
        //        .fullScreenCover(isPresented: $userProfileBtn) {
        //           // UserProfileView(selectDate: selectDate)
        //            UserProfileView()
        //        }
        .fullScreenCover(isPresented: $logoutBtn) {
            LoginView()
            
        }
        //        .fullScreenCover(isPresented: $RtdcPolicyBtn) {
        //            RtdcPolicyView()
        //
        //                }
        //
        
    }
    
    func logout() {
        
        if let userID = UserDefaultsData.getUserStrId(),
           let username = UserDefaultsData.getUserName()
        {
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                // Clear the login status from UserDefaults
                UserDefaults.standard.removeObject(forKey: "userid")
                UserDefaults.standard.removeObject(forKey: "isLoggedIn")
                UserDefaults.standard.removeObject(forKey: "name")
                UserDefaults.standard.removeObject(forKey: "userEmail")
                UserDefaults.standard.removeObject(forKey: "userGender")
                UserDefaults.standard.removeObject(forKey: "userDob")
                UserDefaults.standard.removeObject(forKey: "userCity")
                withAnimation {
                    isLoggedIn = false
                    isShowing = false
                    showProgress = false
                    
                    // Print a message indicating successful logout along with the user ID
                    print("Logout successful. User ID: \(userID) has been logged out.")
                    print("Logout successful. User ID: \(username) has been logged out.")
                }
            }
        } else {
            // Handle case where user ID is not found
            print("Logout not successful, but user ID not found.")
        }
    }
    
}
