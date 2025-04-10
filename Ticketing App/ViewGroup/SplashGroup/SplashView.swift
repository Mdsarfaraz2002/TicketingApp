//
//  SplashView.swift
//  Ticketing App
//
//  Created by nikhil tiwari on 04/04/25.
//



import SwiftUI

struct SplashView: View {
    @State var isActive: Bool = false
    @State var isLoggedIn: Bool = false
    var body: some View {
        ZStack {
            if self.isActive {
                if isLoggedIn {
                    //LoginView()
                    ContentView()
                } else {
//                    ContentView()
                    LoginView()
                }
            } else {
                
                Image("Group 46")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 160, height: 160)
                
            }
        }
        
        .onAppear {
            checkLoginStatus() // Call the function to check login status
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                withAnimation {
                    self.isActive = true
                }
            }
        }
    }
    
    func checkLoginStatus() {
        // Check login status from UserDefaults
        if let loggedIn = UserDefaults.standard.value(forKey: "isLoggedIn") as? Bool {
            // print("Login status found: \(loggedIn)") // Debug output
            self.isLoggedIn = loggedIn
        } else {
            // print("No login status found, setting default as false.")
            self.isLoggedIn = false  // Set to false if not found
        }
    }
    //
}
