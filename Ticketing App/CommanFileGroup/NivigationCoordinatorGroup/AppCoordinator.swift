//
//  AppCoordinator.swift
//  Ticketing App
//
//  Created by nikhil tiwari on 04/04/25.
//

import SwiftUI

class AppCoordinator: ObservableObject {
    @Published var path = NavigationPath()

    func goToDashboard() {
        path.append("Details")
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
    
    func customBackButton(action: @escaping () -> Void, color: Color = .blue) -> some View {
           Button(action: action) {
               Image(systemName: "arrow.left")
                   .bold()
                   .foregroundColor(color)
                   .font(.title3)
           }
       }
}




