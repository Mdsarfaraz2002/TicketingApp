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
                                .frame(minHeight: 220, maxHeight: 260)
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
                VStack {
                    // Weekdays Row
                    
                    
                    // Title
                    Text(ticket.bookingType ?? "")
                        .font(.title3)
                        .fontWeight(.semibold)
                        .foregroundColor(.black)
                        .frame(maxWidth: .infinity,alignment: .leading)
                        .padding(.horizontal,6)
                    
                    // Location
                    Text("Gomti Nagar, Lucknow, Uttar Pradesh")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .frame(maxWidth: .infinity,alignment: .leading)
                        .padding(.horizontal,6)
                    
                    // Timing and Distance
                    HStack{
                        HStack{
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
                            Text("2.3 km away")
                                .foregroundColor(.gray)
                                .fontWeight(.semibold)
                            
                            
                        }
                        .font(.system(size: 12))
                        .frame(maxWidth: .infinity,alignment: .leading)
                        .padding(.leading,6)
                        
                       
                        Button(action: {
                            withAnimation(.spring(response: 0.5, dampingFraction: 0.8)) {
                                navigateToSubPark.toggle()
                            }
                        })
                        {
                            Image(systemName: "arrow.right.circle")
                                .font(.system(size: 20)) // control the size via font
                                .foregroundColor(.black)
                                .fontWeight(.semibold)
                                .padding(.trailing)
                        }
                        
                    }
                    
                }
                .padding(.vertical)
                .background(Color.white)
            }
                
                NavigationLink(
                    destination:  ParkDetailsListView(ticket: ticket),
                    isActive: $navigateToSubPark
                ) {
                    EmptyView()
                }
                
                
            
        }
    }
    
   
}






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


