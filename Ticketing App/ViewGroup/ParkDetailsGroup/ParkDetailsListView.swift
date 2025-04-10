//
//  ParkDetailsListView.swift
//  Ticketing App
//
//  Created by nikhil tiwari on 09/04/25.
//


import SwiftUI

struct ParkDetailsListView: View {
    let ticket: Ticket
    @State private var showSheet = false
    @Environment(\.dismiss) var dismiss
    var body: some View {
        NavigationStack {
            ZStack{
                ScrollView(showsIndicators: false) {
                    VStack(alignment: .leading, spacing: 16) {
                        
                        // Header
                        VStack(alignment: .leading, spacing: 8) {
                            //                        HStack(alignment: .top) {
                            //                            Button(action:{
                            //                                dismiss()
                            //                            }){
                            //                                Image(systemName: "chevron.left")
                            //                                    .font(.title3)
                            //                                    .foregroundStyle(Color.black)
                            //                            }
                            //                         //   Text("Happiness Park long name")
                            //                            Text(ticket.bookingType ?? "")
                            //                                .font(.title3.bold())
                            //                                .lineLimit(2)
                            //                            Spacer()
                            //                        }
                            ReadMoreTextView(fullText: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec dapibus purus non ips.a hiqjwg jad kg")
                                .padding(.horizontal)
                            HStack(spacing: 10) {
                                Label("Open", systemImage: "circle.fill")
                                    .font(.caption)
                                    .foregroundColor(.green)
                                Text("10:00 AM - 09:00 PM")
                                    .font(.caption)
                                    .foregroundColor(.black)
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
                                    .foregroundColor(.black)
                                Image(systemName: "location.fill")
                                    .foregroundColor(.blue)
                            }
                            
                            Divider()
                        }
                        .padding(.horizontal)
                        
                        // Ticket Sections
                        ForEach(0..<5,id: \.self) { _ in
                            
                            TicketCardView(title: "Entry Ticket")
                            TicketCardView(title: "Jurassic Park Ticket")
                        }
                    }
                    .padding(.bottom, 30)
                }
                
                
                if showSheet {
                    Color.black.opacity(0.4)
                        .ignoresSafeArea()
                        .transition(.opacity)
                        .onTapGesture {
                            withAnimation(.easeOut) {
                                showSheet = false
                            }
                        }
                }
                
                if showSheet {
                    OpeningHoursView {
                        withAnimation(.spring()) {
                            showSheet = false
                        }
                    }
                    .transition(
                        AnyTransition
                            .move(edge: .top)
                            .combined(with: .opacity)
                            .combined(with: .scale(scale: 0.95, anchor: .top))
                    )
                    .zIndex(2)
                }
                
                
            }
        }
        .navigationBarBackButtonHidden(true)
        .background(Color.white.ignoresSafeArea())
        .navigationBarTitleDisplayMode(.inline)
        .toolbarBackground(Color(hex:0x252525), for: .navigationBar)
    
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button(action: {
                    dismiss()
                }) {
                           Image(systemName: "arrow.left")
                               .bold()
                               .foregroundColor(Color.white)
                               .font(.title3)
                       }
            }
        }
        
        
    }
}



