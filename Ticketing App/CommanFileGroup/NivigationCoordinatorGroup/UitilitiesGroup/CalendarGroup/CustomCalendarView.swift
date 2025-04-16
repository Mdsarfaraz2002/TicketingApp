//
//  CustomCalendarView.swift
//  Ticketing App
//
//  Created by Mohd Sarfaraz on 14/04/25.
//

import SwiftUI

struct CustomCalendarView: View {
    @Binding var selectedDate: Date
    @Environment(\.dismiss) var dismiss

    // Store the previous date to detect changes
    @State private var lastSelectedDate: Date = Date()

    var body: some View {
        VStack {
            DatePicker(
                "Select a date",
                selection: Binding(
                    get: { selectedDate },
                    set: { newDate in
                        selectedDate = newDate
                        if newDate != lastSelectedDate {
                            dismiss() // Auto dismiss when date changes
                        }
                        lastSelectedDate = newDate
                    }
                ),
                displayedComponents: [.date]
            )
            .datePickerStyle(.graphical)
            .padding()
        }
    }
}

