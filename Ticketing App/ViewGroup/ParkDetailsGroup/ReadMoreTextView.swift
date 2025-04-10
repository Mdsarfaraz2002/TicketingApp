//
//  ReadMoreTextView.swift
//  Ticketing App
//
//  Created by nikhil tiwari on 09/04/25.
//

import SwiftUI


struct ReadMoreText: View {
    let fullText: String
    let lineLimit: Int

    @State private var expanded = false
    @State private var isTruncated = false

    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(fullText)
                .font(.subheadline)
                .foregroundColor(.gray)
                .lineLimit(expanded ? nil : lineLimit)
                .background(
                    Text(fullText)
                        .font(.subheadline)
                        .lineLimit(lineLimit)
                        .background(
                            GeometryReader { geo in
                                Color.clear.onAppear {
                                    let size = CGSize(width: geo.size.width, height: .greatestFiniteMagnitude)
                                    let font = UIFont.preferredFont(forTextStyle: .subheadline)
                                    let rect = fullText.boundingRect(
                                        with: size,
                                        options: [.usesLineFragmentOrigin, .usesFontLeading],
                                        attributes: [.font: font],
                                        context: nil
                                    )

                                    let lineHeight = font.lineHeight
                                    let allowedHeight = lineHeight * CGFloat(lineLimit)

                                    // Enable Read More only if text height > allowed
                                    isTruncated = rect.height > allowedHeight
                                }
                            }
                        )
                        .hidden()
                )

            if isTruncated {
                Button(action: {
                    expanded.toggle()
                }) {
                    Text(expanded ? "Read Less" : "Read More...")
                        .font(.subheadline)
                        .foregroundColor(.blue)
                }
                .buttonStyle(PlainButtonStyle())
            }
        }
    }
}


import SwiftUI

struct ReadMoreTextView: View {
    @State private var expanded = false
    //private let text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec dapibus purus non ips.a hiqjwg jad kg"
    let fullText: String
    var body: some View {
        VStack {
            if expanded {
                Text(fullText)
                    .font(.subheadline)
                    .foregroundColor(.gray)
                +
                Text(" Read Less")
                    .font(.subheadline)
                    .foregroundColor(.blue)
            } else {
                Text(fullText.prefix(70) + "...")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                +
                Text(" Read More...")
                    .font(.subheadline)
                    .foregroundColor(.blue)
            }
        }
        .onTapGesture {
            withAnimation {
                expanded.toggle()
            }
        }
       
    }
}

