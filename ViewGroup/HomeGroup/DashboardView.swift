//
//  DashboardView.swift
//  Ticketing App
//
//  Created by nikhil tiwari on 04/04/25.
//

import SwiftUI

struct DashboardView: View {
    @EnvironmentObject var coordinator: AppCoordinator
    
    var body: some View {
        VStack{
            Text("Hello, World!")
        }
        .navigationBarBackButtonHidden(true)
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        coordinator.customBackButton(action: coordinator.goBack, color: .black)
                    }
                }
    }
}
