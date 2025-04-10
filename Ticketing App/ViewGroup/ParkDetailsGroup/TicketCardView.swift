//
//  TicketCardView.swift
//  Ticketing App
//
//  Created by nikhil tiwari on 09/04/25.
//

import SwiftUI

struct TicketCardView: View {
    var title: String

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(title)
                .font(.headline)
                .padding(.horizontal)

            VStack(spacing: 0) {
                ZStack(alignment: .bottomTrailing){
                    Image("images-27")
                    DaysView()
                        .padding()
                }

                HStack {
                    Text("Open")
                        .foregroundColor(.green)
                        //.fontWeight(.semibold)
                        .font(.caption)
                    Text("10:00 AM - 09:00 PM")
                        .foregroundColor(.gray)
                        //.fontWeight(.semibold)
                        .font(.caption)
//                    Spacer()
//                    DaysView()
                }.frame(maxWidth: .infinity,alignment: .leading)
                    .padding()
                

                // Amenities Tags
                WrapTagsView(tags: ["Picnic Table", "Restrooms", "Park Entry", "Seating", "Shaded Area"])
                    .frame(maxWidth: .infinity,alignment: .leading)
                    .padding(.horizontal)
                    .padding(.bottom)

                Divider()

                HStack {
                    Text("₹ 120.00 onwards")
                        .font(.headline)
                        .foregroundColor(.white)
                    Spacer()
                    HStack(spacing: 4) {
                        Text("Buy Tickets")
                            .foregroundColor(.white)
                        Image(systemName: "chevron.right")
                            .foregroundColor(.white)
                    }
                    .padding(.all,6)
                }
                .padding(.horizontal, 12)
                .padding(.vertical, 8)
                .background(Color.black)
                .cornerRadius(6)
                
            }
            .background(Color.white)
            .cornerRadius(12)
            .shadow(radius: 4)
            .padding(.horizontal)
        }
    }
}
