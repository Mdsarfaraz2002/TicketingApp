//
//  PaymentView.swift
//  Ticketing App
//
//  Created by Mohd Sarfaraz on 14/04/25.
//

import SwiftUI

struct PaymentView: View {
    @Environment(\.dismiss) var dismiss

    var body: some View {
        NavigationStack {
            ZStack {
                VStack {
                    Text("Hello, Innobles")
                }
            }
            //.navigationTitle("Payment")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        dismiss()
                    }) {
                        HStack {
                            Image(systemName: "chevron.left")
                            Text("Back")
                        }
                        .foregroundColor(.blue)
                    }
                }
            }
        }
    }
}
