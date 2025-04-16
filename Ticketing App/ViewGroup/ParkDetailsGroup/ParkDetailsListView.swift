//
//  ParkDetailsListView.swift
//  Ticketing App
//
//  Created by Mohd Sarfaraz  on 09/04/25.
//


import SwiftUI
import CoreLocation
struct ParkDetailsListView: View {
    @State private var userLocation: CLLocationCoordinate2D?
    let ticket: Ticket
    @State private var showSheet = false
    @State private var ticketBookingSheet = false
    @Environment(\.dismiss) var dismiss
    var body: some View {
        NavigationStack {
            ZStack{
                VStack {
                    VStack(alignment: .leading, spacing: 8) {
                        Button(action: {
                            dismiss()
                        }) {
                            HStack(alignment: .top) {
                                Image(systemName: "chevron.left")
                                    .font(.system(size: 20))
                                    .bold()
                                    .foregroundStyle(Color.white)
                                Text(ticket.bookingType ?? "")
                                    .foregroundStyle(Color.white)
                                    .font(.system(size: 20))
                                    .bold()
                                
                                Spacer()
                            }
                        }
                        
                        ReadMoreTextView(fullText: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec dapibus purus non ips.a hiqjwg jad kg", color: .white)
                        
                        HStack(spacing: 10) {
                            Label("Open", systemImage: "circle.fill")
                                .font(.caption)
                                .foregroundColor(.green)
                            Text("10:00 AM - 09:00 PM")
                                .font(.caption)
                                .foregroundColor(.white)
                            Button(action: {
                                
                                withAnimation(.spring(response: 0.5, dampingFraction: 0.8)) {
                                    showSheet.toggle()
                                }
                                
                            }){
                                Image(systemName: "chevron.down")
                                    .foregroundStyle(Color.gray)
                                
                            }
                            Spacer()
                            Text("2.3 kms away")
                                .font(.caption)
                                .foregroundColor(.white)
                            Button(action:{
                                MapHelper.openDirections(to: CLLocationCoordinate2D(latitude: 26.834899, longitude: 80.988686))
                            }){
                                Image(systemName: "location.fill")
                                    .foregroundColor(.blue)
                            }
                        }.padding(.vertical,4)
                        
                        Divider()
                    }.padding(.horizontal,6)
                        .background(Color.black)
                    
                    ScrollView(showsIndicators: false) {
                        // Ticket Sections
                        ForEach(0..<5,id: \.self) { _ in
                            
                            TicketCardView(title: "Entry Ticket", ticketBookingSheet: $ticketBookingSheet)
                                .padding(.top)
                            TicketCardView(title: "Jurassic Park Ticket", ticketBookingSheet: $ticketBookingSheet)
                                .padding(.top)
                        }
                    }
                   
                }
                
                if showSheet {
                    Color.black.opacity(0.6)
                        .edgesIgnoringSafeArea(.all)
                        .transition(.opacity)
                        .animation(.easeInOut, value: showSheet)
                    
                }
                if ticketBookingSheet {
                    Color.black.opacity(0.6)
                        .edgesIgnoringSafeArea(.all)
                        .transition(.opacity)
                        .animation(.easeInOut, value: ticketBookingSheet)
                    
                }
                
            }
            .sheet(isPresented: $showSheet) {
                OpeningHoursView {
                    withAnimation(.spring()) {
                        showSheet = false
                    }
                    
                }
                .presentationDetents([.medium, .large])
                .interactiveDismissDisabled(true)
                .presentationDragIndicator(.hidden)
                .presentationBackground(.clear)
                .presentationCornerRadius(20)
               
            }
            
            .sheet(isPresented: $ticketBookingSheet) {
                TicketBookingView {
                    withAnimation(.spring()) {
                        ticketBookingSheet = false
                    }
                    
                }
                .presentationDetents([.fraction(0.8)])
                .interactiveDismissDisabled(true)
                .presentationDragIndicator(.hidden)
                .presentationBackground(.clear)
                .presentationCornerRadius(20)
               
               
            }
            
           



        }
        .navigationBarBackButtonHidden(true)
//        .navigationBarTitleDisplayMode(.inline)
//        .background(Color.white.ignoresSafeArea())
//        .toolbarBackground(.visible, for: .navigationBar)
//        .toolbarBackground(Color.black, for: .navigationBar)
//        .toolbar {
//            ToolbarItem(placement: .navigationBarLeading) {
//                HStack(alignment: .top) {
//                    Button(action: {
//                        dismiss()
//                    }) {
//                        Image(systemName: "chevron.left")
//                            .font(.system(size:16))
//                            .bold()
//                            .foregroundStyle(Color.white)
//                    }
//                    Text(ticket.bookingType ?? "")
//                        .foregroundStyle(Color.white)
//                        .font(.system(size: 20))
//                        .bold()
//                        .lineLimit(2)
//                        .padding(.top,4)
//                    Spacer()
//                }
//            }
//        }

        
        
    }
   
    
}


