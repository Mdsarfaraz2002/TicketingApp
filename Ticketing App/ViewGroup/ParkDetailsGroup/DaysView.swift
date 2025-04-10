//
//  DaysView.swift
//  Ticketing App
//
//  Created by nikhil tiwari on 09/04/25.
//

import SwiftUI

struct DaysView: View {
    let days = ["M", "T", "W", "T", "F", "S", "S"]

    var body: some View {
        HStack(spacing: 4) {
            ForEach(0..<7, id: \.self) { index in
                Text(days[index])
                    .font(.caption2)
                    .foregroundColor(.white)
                    .frame(width: 26, height: 26)
                    .background(index < 5 ? Color.black : Color.pink)
                    .clipShape(Circle())
            }
        }
    }
}
