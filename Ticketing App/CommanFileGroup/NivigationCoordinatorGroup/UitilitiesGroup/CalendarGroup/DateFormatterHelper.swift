//
//  DateFormatterHelper.swift
//  Ticketing App
//
//  Created by Mohd Sarfaraz on 14/04/25.
//

import Foundation


struct DateFormatterHelper {
    static let shared = DateFormatterHelper()

    let displayFormatter: DateFormatter

    private init() {
        displayFormatter = DateFormatter()
        displayFormatter.dateFormat = "dd MMM yyyy" // Example: 14 Apr 2025
    }
}
