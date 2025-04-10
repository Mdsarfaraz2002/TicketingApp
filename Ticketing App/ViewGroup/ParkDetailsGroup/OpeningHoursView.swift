//
//  OpeningHoursView.swift
//  Ticketing App
//
//  Created by nikhil tiwari on 09/04/25.
//

import SwiftUI

struct OpeningHoursView: View {
    var onClose: () -> Void
    let openingHours: [(day: String, time: String?, isHighlighted: Bool, isClosed: Bool)] = [
        ("Monday", "10:00AM - 09:00PM", false, false),
        ("Tuesday", "10:00AM - 09:00PM", false, false),
        ("Wednesday", "10:00AM - 09:00PM", true, false),
        ("Thursday", "10:00AM - 09:00PM", false, false),
        ("Friday", "10:00AM - 09:00PM", false, false),
        ("Saturday", nil, false, true),
        ("Sunday", "10:00AM - 09:00PM", false, false)
    ]
    
    var body: some View {
        VStack(spacing: 0) {
            Capsule()
                .frame(width: 40, height: 6)
                .foregroundColor(.gray.opacity(0.4))
                .padding(.top, 10)

            HStack {
                Text("Opening Hours")
                    .font(.title3)
                    .fontWeight(.semibold)
                Spacer()
                Button(action: onClose) {
                    Image(systemName: "xmark")
                        .foregroundColor(.primary)
                        .padding(8)
                        .background(Color.white.opacity(0.6))
                        .clipShape(Circle())
                        .padding(.vertical)
                }
            }
            .padding(.horizontal)
            
            Divider()
            
            // List of opening hours
            ForEach(openingHours, id: \.day) { item in
                VStack(spacing: 0) {
                    HStack {
                        Text(item.day)
                            .foregroundColor(item.isHighlighted ? .black : .gray)
                            .fontWeight(item.isHighlighted ? .bold : .regular)
                        
                        Spacer()
                        
                        if item.isClosed {
                            Text("Closed")
                                .foregroundColor(.red)
                                .fontWeight(.regular)
                        } else if let time = item.time {
                            Text(time)
                                .foregroundColor(item.isHighlighted ? .black : .gray)
                                .fontWeight(item.isHighlighted ? .bold : .regular)
                        }
                    }
                    .padding(.horizontal)
                    .padding(.vertical, 12)
                    
                    Divider()
                }
            }
        }
        .background(Color.white)
       // .cornerRadius(30, corners: [.topLeft, .topRight])
        .shadow(radius: 5)
        .frame(maxHeight: .infinity, alignment: .bottom)
       
    }
}

extension View {
    /// Add specific corner radius
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corners: corners))
    }
}

struct RoundedCorner: Shape {
    var radius: CGFloat
    var corners: UIRectCorner
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(
            roundedRect: rect,
            byRoundingCorners: corners,
            cornerRadii: CGSize(width: radius, height: radius)
        )
        return Path(path.cgPath)
    }
}

