//
//  PaymentFailedView.swift
//  Ticketing App
//
//  Created by Mohd Sarfaraz on 16/04/25.
//

import SwiftUI

struct PaymentFailedView: View {
    @State private var navigateToPayment = false
    var body: some View {
        VStack {
            VStack {
                // Header alert section
                HStack {
                    Image(systemName: "exclamationmark.octagon.fill")
                        .foregroundColor(.red)
                        .font(.title2)
                    Text("Some problem with your payment")
                        .foregroundColor(.red)
                        .font(.headline)
                }
                .frame(maxWidth: .infinity,alignment: .leading)
                .padding()
                .background(Color.yellow.opacity(0.3))
               

                // Payment info section
                VStack(spacing: 16) {
                    HStack {
                        VStack(alignment: .leading, spacing: 10) {
                            Text("Janeshwar Mishra Park")
                                .fontWeight(.bold)
                            Text("Amount Paid")
                            Text("₹ 250")
                                .font(.headline)
                        }.padding(.vertical,6)

                        Spacer()

                        VStack(alignment: .leading, spacing: 10) {
                            Text("Jurassic Park")
                                .fontWeight(.bold)
                            Text("Visit Date")
                            Text("24 May, 2023")
                                .font(.headline)
                        }.padding(.vertical,6)
                    }

                    // Retry Button
                    Button(action: {
                        navigateToPayment.toggle()
                    }) {
                        Text("Retry Now")
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color(hex:0x008000))
                            .cornerRadius(12)
                    }

                    // Footer note
                    Text("Retry will not charge payment again. It may take 15-20 minutes to process.")
                        .font(.footnote)
                        .foregroundColor(.gray)
                        .multilineTextAlignment(.center)
                        .padding(.top, 4)
                }
                .padding(.horizontal)
              
                
            }
            .cornerRadius(16, corners: [.topLeft, .topRight])
            
        }
        .frame(maxHeight: .infinity, alignment: .top)
        .background(Color(UIColor.systemGroupedBackground))
        .edgesIgnoringSafeArea(.all)
        
        .fullScreenCover(isPresented: $navigateToPayment) {
            PaymentView()
        }
    }
}

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape( RoundedCorner(radius: radius, corners: corners) )
    }
}


