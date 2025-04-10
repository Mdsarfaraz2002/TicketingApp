//
//  TabBarButtonView.swift
//  Ticketing App
//
//  Created by nikhil tiwari on 07/04/25.
//

import SwiftUI

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
