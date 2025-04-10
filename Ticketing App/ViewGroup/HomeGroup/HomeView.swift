//
//  DashboardView.swift
//  Ticketing App
//
//  Created by nikhil tiwari on 04/04/25.
//

//import SwiftUI
//
//struct DashboardView: View {
//    @EnvironmentObject var coordinator: AppCoordinator
//    
//    var body: some View {
//        VStack{
//            Text("Hello, World!")
//        }
//        .navigationBarBackButtonHidden(true)
//        .toolbar {
//            ToolbarItem(placement: .navigationBarLeading) {
//                coordinator.customBackButton(action: coordinator.goBack, color: .black)
//            }
//        }
//    }
//}

//import SwiftUI
//
//struct DashboardView: View {
//     var coordinator: AppCoordinator
//
//    var body: some View {
//        VStack(spacing: 20) {
//            Text("🎉 Welcome to Dashboard!")
//                .font(.largeTitle)
//                .foregroundColor(.black)
//
//            Button("Button") {
//                coordinator.goToDetails()
//            }
//        }
//        .frame(maxWidth: .infinity, maxHeight: .infinity)
//        .background(Color.white) // ✅ Make sure background is not black
//        .navigationBarBackButtonHidden(true)
//        .toolbar {
//            ToolbarItem(placement: .navigationBarLeading) {
//                coordinator.customBackButton(action: coordinator.goBack, color: .black)
//            }
//        }
//        .onAppear {
//            print("✅ DashboardView appeared.")
//        }
//    }
//}






import SwiftUI

struct DetailsView: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Details Page")
                .font(.largeTitle)
                .fontWeight(.bold)
            
            Text("Here you can show detailed information.")
                .font(.body)
                .foregroundColor(.gray)
            
            Spacer()
        }
        .padding()
        .navigationTitle("Details")
        .navigationBarTitleDisplayMode(.inline)
    }
}

