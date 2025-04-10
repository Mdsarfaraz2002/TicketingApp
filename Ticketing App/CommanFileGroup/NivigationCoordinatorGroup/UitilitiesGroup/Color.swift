//
//  Color.swift
//  Ticketing App
//
//  Created by nikhil tiwari on 04/04/25.
//

import Foundation
import SwiftUI

extension Color {
    
    init(hex: UInt, alpha: Double = 1) {
        self.init(
            .sRGB,
            red: Double((hex >> 16) & 0xFF) / 255.0,
            green: Double((hex >> 8) & 0xFF) / 255.0,
            blue: Double(hex & 0xFF) / 255.0,
            opacity: alpha
        )
    }
}


