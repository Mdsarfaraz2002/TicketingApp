//
//  AppCoordinator.swift
//  Ticketing App
//
//  Created by nikhil tiwari on 04/04/25.
//

import SwiftUI

class AppCoordinator: ObservableObject {
    @Published var path = NavigationPath()

    func goToDetails() {
        path.append("Details")
    }

    func goToProfile(userID: Int) {
        path.append("Profile")
    }
    func goToOtpScreen() {
        path.append("OtpScreen")
    }

    func goBack() {
        path.removeLast()
    }

    func reset() {
        path = NavigationPath()
    }
}




struct DetailsView: View {
    @EnvironmentObject var coordinator: AppCoordinator

    var body: some View {
        VStack {
            Text("📄 Details Screen").font(.largeTitle)
            
            Button("Go Back") {
                coordinator.goBack()
            }
            .padding()
        }
    }
}


