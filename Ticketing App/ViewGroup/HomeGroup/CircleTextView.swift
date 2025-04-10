//
//  CircleTextView.swift
//  Ticketing App
//
//  Created by nikhil tiwari on 07/04/25.
//

import SwiftUI

struct CircleText: View {
    let text: String
    let bgColor: Color

    var body: some View {
        Text(text)
            .font(.caption)
            .foregroundColor(.white)
            .frame(width: 28, height: 28)
            .background(bgColor)
            .clipShape(Circle())
    }
}
