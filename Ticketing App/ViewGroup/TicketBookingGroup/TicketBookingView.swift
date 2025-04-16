//
//  BuyTicketView.swift
//  Ticketing App
//
//  Created by Mohd Sarfaraz on 10/04/25.
//

import SwiftUI

struct TicketBookingView: View {
    @State private var indianCount = 0
    @State private var foreignerCount = 0
    @State private var isTermsAccepted = false
    @State private var showTerms = false
    @State private var selectedDate = Date()
    @State private var showCalendar = false
    @Environment(\.presentationMode) var presentationMode
    @State private var navigateToPayment = false
    var onClose: () -> Void
    
    var totalTickets: Int {
        indianCount + foreignerCount
    }
    
    var totalPrice: Int {
        (indianCount * 150) + (foreignerCount * 300)
    }
    
    var body: some View {
        // NavigationStack{
        VStack {
            CloseHeaderView {
                presentationMode.wrappedValue.dismiss()
            }
            
            VStack {
                
                // Title
                HStack {
                    Text("Happiness Park")
                        .font(.subheadline)
                        .bold()
                        .foregroundColor(.black)
                    Text("- Kingdom of dreams")
                        .font(.subheadline)
                        .bold()
                        .foregroundColor(.gray)
                    
                    
                }.frame(maxWidth: .infinity,alignment: .leading)
                    .padding(.horizontal,6)
                    .padding(.vertical)
                Divider()
                //                    .frame(height: 1)
                //                        .overlay(.gray)
                
                Button(action: {
                    showCalendar = true
                }) {
                    HStack {
                        Image(systemName: "calendar")
                            .bold()
                            .foregroundStyle(Color.black)
                        
                        Text(DateFormatterHelper.shared.displayFormatter.string(from: selectedDate))
                            .foregroundColor(.black)
                        Spacer()
                    }
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.gray.opacity(0.4))
                    )
                }
                .padding(.horizontal,6)
                
                // Ticket Counter Section
                VStack(spacing: 16) {
                    TicketCounterRow(title: "Indian", price: 150, count: $indianCount)
                    Divider()
                    TicketCounterRow(title: "Foreigner", price: 300, count: $foreignerCount)
                    
                    
                }
                .padding()
                .background(RoundedRectangle(cornerRadius: 12).stroke(Color.gray.opacity(0.3)))
                .padding(.horizontal,6)
                
                // Terms & Conditions
                VStack(alignment: .leading, spacing: 8) {
                    Button(action: {
                        isTermsAccepted.toggle()
                    }) {
                        HStack {
                            Image(systemName: isTermsAccepted ? "checkmark.square" : "square")
                                .bold()
                                .foregroundStyle(Color.gray)
                            Text("I accept the Terms & Conditions")
                                .bold()
                                .foregroundStyle(Color.black)
                            Spacer()
                            Button(action: {
                                showTerms.toggle()
                            }) {
                                
                                Image(systemName: showTerms ? "chevron.up.circle" : "chevron.down.circle")
                                    .bold()
                                    .foregroundStyle(Color.gray)
                                
                                
                            }
                        }
                    }
                    
                    if showTerms {
                        ScrollView(showsIndicators: false) {
                            VStack(alignment: .leading, spacing: 8) {
                                ForEach(0..<5, id: \.self) { _ in
                                    Text("• Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec dapibus purus non ipsum rutrum.")
                                }
                            }
                            .font(.footnote)
                            .foregroundColor(.gray)
                        }
                        .frame(height: 150)
                    }
                }
                .padding()
                .background(RoundedRectangle(cornerRadius: 12).stroke(Color.gray.opacity(0.3)))
                .padding(.horizontal,6)
                
                Spacer()
                Divider()
                //                    .frame(height: 1)
                //                        .overlay(.gray)
                // Footer
                HStack {
                    VStack(alignment: .leading) {
                        Text("\(totalTickets) tickets")
                            .font(.caption)
                            .foregroundColor(.gray)
                        Text("Rs. \(totalPrice)")
                            .font(.headline)
                    }
                    
                    Spacer()
                    
                    Button(action: {
                        navigateToPayment.toggle()
                    }) {
                        Text("Continue")
                            .foregroundColor(.white)
                            .bold()
                            .padding()
                            .frame(width: 240,height: 50)
                            .background(totalTickets > 0 && isTermsAccepted ? Color.black : Color.gray)
                            .cornerRadius(12)
                    }
                    .disabled(!(totalTickets > 0 && isTermsAccepted))
                }
                .padding(.bottom)
                .padding(.horizontal)
            }
            .background(Color.white)
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .shadow(radius: 5)
            .sheet(isPresented: $showCalendar) {
                CustomCalendarView(selectedDate: $selectedDate)
                    .presentationDetents([.medium])
            }
        }
        .background(Color.clear)
        .edgesIgnoringSafeArea(.all)
        .fullScreenCover(isPresented: $navigateToPayment) {
            PaymentView()
        }
        // }
    }
    
}





