//
//  LoginView.swift
//  Ticketing App
//
//  Created by nikhil tiwari on 04/04/25.
//
import SwiftUI

struct LoginView: View {
    @EnvironmentObject var coordinator: AppCoordinator

    var body: some View {
        NavigationStack(path: $coordinator.path) {
            VStack {
                Text("Login View")
                    .bold()

                Button("Go to Otp Screen") {
                    coordinator.goToOtpScreen()
                }
            }
            .navigationDestination(for: String.self) { destination in
                if destination == "OtpScreen" {
                    OtpScreenView()
                }
            }
        }
    }
}



