//
//  Ticketing_AppApp.swift
//  Ticketing App
//
//  Created by nikhil tiwari on 04/04/25.
//

import SwiftUI

@main
struct Ticketing_AppApp: App {
    @StateObject var coordinator = AppCoordinator()
    var body: some Scene {
        WindowGroup {
           // ContentView()
            SplashView()
                .environmentObject(coordinator)
        }
    }
}
