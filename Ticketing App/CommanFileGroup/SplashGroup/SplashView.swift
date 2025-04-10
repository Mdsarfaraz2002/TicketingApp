//
//  SplashView.swift
//  Ticketing App
//
//  Created by nikhil tiwari on 04/04/25.
//


import SwiftUI

struct SplashView: View {
    @State private var isActive = false
    @State private var isLoggedIn = false

    var body: some View {
        ZStack {
            if isActive {
                if isLoggedIn {
                    
                    ContentView()
                } else {
                 LoginView()
                  
                    
                    
                }
            } else {
                // Splash Screen Image
                Image("Group 46")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 160, height: 160)
            }
        }
        .onAppear {
            // Load login status before splash finishes
            checkLoginStatus()
            
            // Show splash for 2 seconds
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                withAnimation {
                    self.isActive = true
                }
            }
        }
    }

    private func checkLoginStatus() {
        self.isLoggedIn = UserDefaults.standard.bool(forKey: "isLoggedIn")
    }
}



