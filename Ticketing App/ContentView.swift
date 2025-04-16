//
//  ContentView.swift
//  Ticketing App
//
//  Created by Mohd Sarfaraz  on 04/04/25.

import SwiftUI

struct ContentView: View {
   // @ObservedObject var coordinator: AppCoordinator
    @State private var selectedTab: Tab = .home

    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                // Show full views here
                Group {
                    switch selectedTab {
                    case .home:
                        HomeView()
                    case .bookings:
                        BookingsView()
                    case .profile:
                        ProfileView()
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)

                CustomTabBar(selectedTab: $selectedTab)
            }
            .edgesIgnoringSafeArea(.bottom)
            .background(Color.white)
            .navigationBarBackButtonHidden(true)
        }
    }
}
