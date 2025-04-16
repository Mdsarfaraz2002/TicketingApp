//
//  LastBookingCardView.swift
//  Ticketing App
//
//  Created by Mohd Sarfaraz on 16/04/25.
//


import SwiftUI

struct LastBookingCardView: View {
    var body: some View {
        NavigationLink(destination: MyBookingView()) {
            VStack{
                Spacer()
                HStack {
                    VStack(alignment: .leading, spacing: 6) {
                        Text("Upcoming Bookings")
                            .font(.caption)
                            .foregroundColor(.gray)
                        
                        Text("Happiness park")
                            .font(.headline)
                            .foregroundColor(.white)
                    }
                    
                    Spacer()
                    
                    VStack(alignment: .leading, spacing: 6) {
                        Text("Visit date")
                            .font(.caption)
                            .foregroundColor(.gray)
                        
                        Text("23 May, 2025")
                            .font(.headline)
                            .foregroundColor(.white)
                    }
                    
                    Spacer()
                    
                    // QR Icon
                    Image(systemName: "qrcode")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 30, height: 30)
                        .foregroundColor(.white)
                }
                .padding()
                .background(Color.black)
                .cornerRadius(8)
                .padding(.horizontal,6)
            }
        }.buttonStyle(PlainButtonStyle())
    }
}


