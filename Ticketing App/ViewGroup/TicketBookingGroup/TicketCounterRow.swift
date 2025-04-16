//
//  TicketCounterRow.swift
//  Ticketing App
//
//  Created by Mohd Sarfaraz on 11/04/25.
//

import SwiftUI

struct TicketCounterRow: View {
    var title: String
    var price: Int
    @Binding var count: Int

    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(title)
                    .font(.headline)
                Text("Rs. \(price)")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }

            Spacer()

            HStack(spacing: 8) {
                Button(action: {
                    if count > 0 { count -= 1 }
                }) {
                    Text("-")
                        .font(.title3)
                        .bold()
                        .frame(width: 35, height: 35)
                        .foregroundColor(.black)
                        .background(RoundedRectangle(cornerRadius: 6).stroke(Color.gray).bold())
                }

                Text("\(count)")
                    .frame(width: 80, height: 35)
                    .background(Color.black)
                    .foregroundColor(.white)
                    .cornerRadius(6)

                Button(action: {
                    count += 1
                }) {
                    Text("+")
                        .font(.title3)
                        .bold()
                        .frame(width: 35, height: 35)
                        .foregroundColor(Color(hex: 0x000000))
                        .background(RoundedRectangle(cornerRadius: 6).stroke(Color(hex: 0x9A1414)).bold())
                }
            }
        }
    }
}
