//
//  ParkCardView.swift
//  Ticketing App
//
//  Created by nikhil tiwari on 07/04/25.
//

import SwiftUI
import CoreLocation

struct ParkCardView: View {
    let ticket: Ticket
    @StateObject private var locationManager = LocationManager()
   // @EnvironmentObject var coordinator: AppCoordinator
    @State private var showSheet = false
    @State private var navigateToSubPark = false
        var body: some View {
            NavigationStack {
            VStack{
                // Image
                ZStack(alignment: .bottomTrailing){
                    AsyncImage(url: URL(string: ticket.image ?? "")) { phase in
                        switch phase {
                        case .empty:
                            // While loading
                            ProgressView()
                                .frame(height: 220)
                        case .success(let image):
                            // If image loads successfully
                            image
                                .resizable()
                                .scaledToFill()
                                .frame(minHeight: 220, maxHeight: 220)
                                .frame(maxWidth: .infinity)
                                .clipped()
                        case .failure(_):
                            // Show default image on failure
                            Image(systemName: "photo.fill")
                                .resizable()
                                .scaledToFill()
                                .frame(minHeight: 220, maxHeight: 220)
                                .frame(maxWidth: .infinity)
                                .clipped()
                        @unknown default:
                            // Just in case future versions introduce more cases
                            Image(systemName: "photo.fill")
                                .resizable()
                                .scaledToFill()
                                .frame(minHeight: 220, maxHeight: 220)
                                .frame(maxWidth: .infinity)
                                .clipped()
                        }
                    }
                    
                    
                    HStack(spacing: 6) {
                        DaysView()
                    }.padding()
                }
                // Bottom Card Content
                VStack(alignment: .leading, spacing: 8) {
                    // Weekdays Row
                    
                    
                    // Title
                    Text(ticket.bookingType ?? "")
                        .font(.title3)
                        .fontWeight(.semibold)
                        .foregroundColor(.black)
                    
                    // Location
                    Text("Gomti Nagar, Lucknow, Uttar Pradesh")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                    
                    
                    // Timing and Distance
                    HStack(spacing: 12) {
                        //                    Text(ticket.isOpen ? "Currently Open" : "Closed")
                        //                           .foregroundColor(ticket.isOpen ? .green : .red)
                        //                           .fontWeight(.semibold)
                        Text("Currently Open")
                            .foregroundColor(.green)
                            .fontWeight(.semibold)
                        Circle()
                            .frame(width: 5, height: 5)
                            .foregroundColor(.gray)
                        Text("10:00AM - 09:00PM")
                            .foregroundColor(.gray)
                            .fontWeight(.semibold)
                        Circle()
                            .frame(width: 5, height: 5)
                            .foregroundColor(.gray)
                            .fontWeight(.semibold)
                        Text("2.3 km")
                            .foregroundColor(.gray)
                            .fontWeight(.semibold)
                        //Spacer()
                        Button(action:{
                            print("navigate to details view")
                            withAnimation(.spring(response: 0.5, dampingFraction: 0.8)) {
                                navigateToSubPark.toggle()
                            }
                            
                        }){
                            Image(systemName: "arrow.right.circle")
                                .foregroundColor(.black)
                                .fontWeight(.semibold)
                        }
                    }
                    .font(.footnote)
                }
                .padding()
                .background(Color.white)
            }
                
                NavigationLink(
                    destination:  ParkDetailsListView(ticket: ticket),
                    isActive: $navigateToSubPark
                ) {
                    EmptyView()
                }
                
                
//            .fullScreenCover(isPresented: $showSheet) {
//                ParkDetailsListView(ticket: ticket)
//            }
            
        }
    }
    
    
}











//    func openGoogleMaps() {
//            let destinationLatitude = 26.8467
//            let destinationLongitude = 80.9462
//            let destination = CLLocation(latitude: destinationLatitude, longitude: destinationLongitude)
//
//            // Open in Google Maps
//            if let url = URL(string: "comgooglemaps://?daddr=\(destinationLatitude),\(destinationLongitude)&directionsmode=driving"),
//               UIApplication.shared.canOpenURL(url) {
//                UIApplication.shared.open(url)
//            } else if let appleUrl = URL(string: "http://maps.apple.com/?daddr=\(destinationLatitude),\(destinationLongitude)") {
//                UIApplication.shared.open(appleUrl)
//            }
//
//            // Print distance
//            if let userLocation = locationManager.currentLocation {
//                let distanceInMeters = userLocation.distance(from: destination)
//                let distanceInKm = distanceInMeters / 1000
//                print("Location distance: \(String(format: "%.2f", distanceInKm)) km")
//            } else {
//                print("Current location not available")
//            }
//        }
    







import Foundation
import CoreLocation

class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    private let manager = CLLocationManager()
    @Published var currentLocation: CLLocation?

    override init() {
        super.init()
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        currentLocation = locations.first
    }
}
