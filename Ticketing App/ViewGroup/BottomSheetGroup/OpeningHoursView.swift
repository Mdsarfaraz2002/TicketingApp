//
//  OpeningHoursView.swift
//  Ticketing App
//
//  Created by nikhil tiwari on 09/04/25.
//


import SwiftUI

struct OpeningHoursView: View {
    @Environment(\.presentationMode) var presentationMode
    var onClose: () -> Void
    
    var body: some View {
            VStack(spacing: 0) {
                // Close Button
                CloseHeaderView {
                    presentationMode.wrappedValue.dismiss()
                }
                Spacer()
                    .frame(height: 16)
                
                // Content Box
                VStack(spacing: 0) {
                    // Header
                    Text("Opening Hours")
                        .font(.title2)
                        .fontWeight(.bold)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding()
                    
                    Divider()
                    
                    ForEach(days, id: \.day) { item in
                        HStack {
                            Text(item.day)
                                .fontWeight(item.isToday ? .bold : .regular)
                                .foregroundColor(item.isClosed ? .gray : .primary)
                            
                            Spacer()
                            
                            if item.isClosed {
                                Text("Closed")
                                    .foregroundColor(.red)
                                    .fontWeight(.semibold)
                            } else {
                                Text("\(item.openTime) - \(item.closeTime)")
                                    .fontWeight(item.isToday ? .bold : .regular)
                                    .foregroundColor(item.isToday ? .primary : .gray)
                            }
                        }
                        .padding(.horizontal)
                        .padding(.vertical, 12)
                        
                        Divider()
                    }
                    
                    Spacer()
                }
                .background(Color.white)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .shadow(radius: 5)
                
            }
            
            .background(Color.clear)
            .edgesIgnoringSafeArea(.all)
        
    }
}


struct DayHours {
    let day: String
    let openTime: String
    let closeTime: String
    let isClosed: Bool
    let isToday: Bool
}

let days: [DayHours] = [
    DayHours(day: "Monday", openTime: "10:00AM", closeTime: "09:00PM", isClosed: false, isToday: false),
    DayHours(day: "Tuesday", openTime: "10:00AM", closeTime: "09:00PM", isClosed: false, isToday: false),
    DayHours(day: "Wednesday", openTime: "10:00AM", closeTime: "09:00PM", isClosed: false, isToday: true),
    DayHours(day: "Thursday", openTime: "10:00AM", closeTime: "09:00PM", isClosed: false, isToday: false),
    DayHours(day: "Friday", openTime: "10:00AM", closeTime: "09:00PM", isClosed: false, isToday: false),
    DayHours(day: "Saturday", openTime: "", closeTime: "", isClosed: true, isToday: false),
    DayHours(day: "Sunday", openTime: "10:00AM", closeTime: "09:00PM", isClosed: false, isToday: false)
]

struct RoundedCorner: Shape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(
            roundedRect: rect,
            byRoundingCorners: corners,
            cornerRadii: CGSize(width: radius, height: radius)
        )
        return Path(path.cgPath)
    }
}


