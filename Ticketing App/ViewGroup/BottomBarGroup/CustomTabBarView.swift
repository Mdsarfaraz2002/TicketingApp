//
//  CustomBottomBarView.swift
//  Ticketing App
//
//  Created by nikhil tiwari on 07/04/25.
//

import SwiftUI

enum Tab {
    case home, bookings, profile
}


struct CustomTabBar: View {
    @Binding var selectedTab: Tab

    var body: some View {
        
        ZStack {
            Color.black
                .frame(height: 90)
                .edgesIgnoringSafeArea(.bottom)

            HStack {
                TabBarButton(icon: "house.fill", label: "Home", tab: .home, selectedTab: $selectedTab)
                Spacer()
                TabBarButton(icon: "ticket.fill", label: "My Bookings", tab: .bookings, selectedTab: $selectedTab)
                Spacer()
                TabBarButton(icon: "person.fill", label: "Profile", tab: .profile, selectedTab: $selectedTab)
            }
            .padding(.horizontal, 40)
        }
    }
}







struct BookingsView: View {
    var body: some View {
        VStack {
            Text("🎟️ My Bookings")
                .font(.largeTitle)
        }
    }
}

struct ProfileView: View {
    var body: some View {
        VStack {
            Text("👤 Profile View")
                .font(.largeTitle)
        }
    }
}
