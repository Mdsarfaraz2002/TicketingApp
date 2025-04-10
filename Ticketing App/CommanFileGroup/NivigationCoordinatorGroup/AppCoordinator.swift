//
//  AppCoordinator.swift
//  Ticketing App
//
//  Created by nikhil tiwari on 04/04/25.
//

//import SwiftUI
//
//enum AppScreen: Hashable {
//    case otp
//    case content
//   // case detailsList
//}
//
//
//class AppCoordinator: ObservableObject {
//    @Published var path = NavigationPath()
//
//    func goToOtpScreen() {
//        path.append(AppScreen.otp)
//    }
//
//    func goToContent() {
//        path.append(AppScreen.content)
//    }
////    func goToDetailsList() {
////        path.append(AppScreen.detailsList)
////    }
////    func goToDetails() {
////        path.append(AppScreen.details)
////    }
//
//    func goBack() {
//        path.removeLast()
//    }
//
//    func reset() {
//        path = NavigationPath()
//    }
//
//    func customBackButton(action: @escaping () -> Void, color: Color = .blue) -> some View {
//        Button(action: action) {
//            Image(systemName: "arrow.left")
//                .bold()
//                .foregroundColor(color)
//                .font(.title3)
//        }
//    }
//}
//
//
