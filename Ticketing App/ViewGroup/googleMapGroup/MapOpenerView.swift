//
//  MapOpenerView.swift
//  Ticketing App
//
//  Created by Mohd Sarfaraz on 11/04/25.
//



// MapHelper.swift
import Foundation
import CoreLocation
import UIKit

struct MapHelper {
    
    static func calculateDistance(from: CLLocationCoordinate2D, to: CLLocationCoordinate2D) -> String {
        let fromLocation = CLLocation(latitude: from.latitude, longitude: from.longitude)
        let toLocation = CLLocation(latitude: to.latitude, longitude: to.longitude)
        let distanceInMeters = fromLocation.distance(from: toLocation)
        let distanceInKm = distanceInMeters / 1000.0
        return String(format: "%.1f kms away", distanceInKm)
    }

    static func openDirections(to: CLLocationCoordinate2D) {
        let googleURL = URL(string: "comgooglemaps://?saddr=&daddr=\(to.latitude),\(to.longitude)&directionsmode=driving")
        let appleURL = URL(string: "http://maps.apple.com/?daddr=\(to.latitude),\(to.longitude)&dirflg=d")

        if let googleMapsURL = googleURL, UIApplication.shared.canOpenURL(googleMapsURL) {
            UIApplication.shared.open(googleMapsURL)
        } else if let fallbackURL = appleURL {
            UIApplication.shared.open(fallbackURL)
        }
    }
}
