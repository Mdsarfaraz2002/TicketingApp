//
//  TicketCardView.swift
//  Ticketing App
//
//  Created by Mohd Sarfaraz on 09/04/25.
//

import SwiftUI

struct TicketCardView: View {
    var title: String
   // @State private var TicketBookingSheet = false
    @Binding var ticketBookingSheet: Bool
    var body: some View {
       
        VStack(alignment: .leading, spacing: 10) {
            Text(title)
                .font(.headline)
                .frame(maxWidth: .infinity,alignment: .leading)
                .padding(.leading,6)
                .padding(.bottom)
            
            
            VStack(spacing: 0) {
                ZStack(alignment: .bottomTrailing){
                    Image("images-27")
                        .resizable()
                        .scaledToFill()
                        .frame(maxWidth: .infinity)
                        .clipped()
                    DaysView()
                        .padding()
                }
                
                
                ReadMoreTextView(fullText: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec dapibus purus non ips.a hiqjwg jad kg", color: .black)
                    .padding(.top,6)
                HStack {
                    Text("Open")
                        .foregroundColor(.green)
                    //.fontWeight(.semibold)
                        .font(.caption)
                    Text("10:00 AM - 09:00 PM")
                        .font(.caption)
                        .foregroundColor(.black)
                }.frame(maxWidth: .infinity,alignment: .leading)
                    .padding(.vertical,6)
                    .padding(.horizontal,6)
                
                // Amenities Tags
                WrapTagsView(tags: ["Picnic Table", "Restrooms", "Park Entry", "Seating", "Shaded Area"])
                    .frame(maxWidth: .infinity,alignment: .leading)
                    .padding(.horizontal,6)
                    .padding(.bottom)
                
                Divider()
                
                HStack {
                    
                    HStack{
                        Text("₹ 120.00 onwards")
                            .font(.headline)
                            .foregroundColor(.white)
                        Spacer()
                        Button(action:{
                            withAnimation(.spring(response: 0.5, dampingFraction: 0.8)) {
                                ticketBookingSheet.toggle()
                            }
                            
                        }){
                            HStack(spacing: 4) {
                                Text("Buy Tickets")
                                    .foregroundColor(.white)
                                Image(systemName: "chevron.right")
                                    .foregroundColor(.white)
                            }
                            .padding(.all,6)
                        }
                    }
                    .padding(.horizontal,6)
                }
                // .padding(.horizontal)
                .padding(.vertical, 8)
                .background(Color.black)
                //.cornerRadius(6)
                
            }
            .background(Color.white)
            .cornerRadius(12)
            .shadow(radius: 4)
            .padding(.horizontal,6)
        }
//            if ticketBookingSheet {
//                Color.black.opacity(0.6)
//                    .edgesIgnoringSafeArea(.all)
//                    .transition(.opacity)
//                    .animation(.easeInOut, value: ticketBookingSheet)
//                
//            }
    
            
        
        
    }
}


