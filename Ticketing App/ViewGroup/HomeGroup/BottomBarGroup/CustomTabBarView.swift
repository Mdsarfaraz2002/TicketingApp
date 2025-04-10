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
                .clipShape(RoundedRectangle(cornerRadius: 0))
                .shadow(radius: 5)

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

struct TabBarButton: View {
    var icon: String
    var label: String
    var tab: Tab
    @Binding var selectedTab: Tab

    var body: some View {
        Button(action: {
            selectedTab = tab
        }) {
            VStack(spacing: 6) {
                Image(systemName: icon)
                    .font(.system(size: 22))
                    .foregroundColor(selectedTab == tab ? .white : .gray)
                Text(label)
                    .font(.system(size: 14))
                    .foregroundColor(selectedTab == tab ? .white : .gray)
            }
        }
    }
}
