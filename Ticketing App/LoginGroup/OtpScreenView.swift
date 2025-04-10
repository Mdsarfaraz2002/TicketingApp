//
//  OtpScreenView.swift
//  Ticketing App
//
//  Created by nikhil tiwari on 04/04/25.
//

import SwiftUI

struct OtpScreenView: View {
    @EnvironmentObject var coordinator: AppCoordinator
    var body: some View {
        VStack {
            Text("Otp Screen")
            
            Button("Go to Details View") {
                coordinator.goToDetails()
            }
        }
        .navigationDestination(for: String.self) { destination in
            if destination == "Details" {
                DetailsView()
            }
        }
    }
}
