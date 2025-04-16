//
//  ReadMoreTextView.swift
//  Ticketing App
//
//  Created by Mohd Sarfaraz  on 09/04/25.
//

import SwiftUI


//struct ReadMoreText: View {
//    let fullText: String
//    let lineLimit: Int
//
//    @State private var expanded = false
//    @State private var isTruncated = false
//
//    var body: some View {
//        VStack(alignment: .leading, spacing: 4) {
//            Text(fullText)
//                .font(.subheadline)
//                .foregroundColor(.gray)
//                .lineLimit(expanded ? nil : lineLimit)
//                .background(
//                    Text(fullText)
//                        .font(.subheadline)
//                        .lineLimit(lineLimit)
//                        .background(
//                            GeometryReader { geo in
//                                Color.clear.onAppear {
//                                    let size = CGSize(width: geo.size.width, height: .greatestFiniteMagnitude)
//                                    let font = UIFont.preferredFont(forTextStyle: .subheadline)
//                                    let rect = fullText.boundingRect(
//                                        with: size,
//                                        options: [.usesLineFragmentOrigin, .usesFontLeading],
//                                        attributes: [.font: font],
//                                        context: nil
//                                    )
//
//                                    let lineHeight = font.lineHeight
//                                    let allowedHeight = lineHeight * CGFloat(lineLimit)
//
//                                    // Enable Read More only if text height > allowed
//                                    isTruncated = rect.height > allowedHeight
//                                }
//                            }
//                        )
//                        .hidden()
//                )
//
//            if isTruncated {
//                Button(action: {
//                    expanded.toggle()
//                }) {
//                    Text(expanded ? "Read Less" : "Read More...")
//                        .font(.subheadline)
//                        .foregroundColor(.blue)
//                }
//                .buttonStyle(PlainButtonStyle())
//            }
//        }
//    }
//}
//
//
//import SwiftUI
//
//struct ReadMoreTextView: View {
//    @State private var expanded = false
//    //private let text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec dapibus purus non ips.a hiqjwg jad kg"
//    let fullText: String
//    var body: some View {
//        VStack {
//            if expanded {
//                Text(fullText)
//                    .font(.subheadline)
//                    .foregroundColor(.white)
//                
//                +
//                Text(" Read Less")
//                    .font(.subheadline)
//                    .foregroundColor(.blue)
//            } else {
//                Text(fullText.prefix(70) + "...")
//                    .font(.subheadline)
//                    .foregroundColor(.white)
//                +
//                Text(" Read More...")
//                    .font(.subheadline)
//                    .foregroundColor(.blue)
//            }
//        }
//        .onTapGesture {
//            withAnimation {
//                expanded.toggle()
//            }
//        }
//       
//    }
//}

import SwiftUI

struct ReadMoreTextView: View {
    let fullText: String
    @State private var showSheet = false
    @Namespace private var animation
    let color: Color
    var body: some View {
        ZStack{
            
        VStack(alignment: .leading) {
            
            (
                Text(fullText.prefix(70) + "...")
                    .font(.subheadline)
                    .foregroundColor(color)
                +
                Text(" Read More...")
                    .font(.subheadline)
                    .foregroundColor(.blue)
            )
            .onTapGesture {
                withAnimation(.easeInOut(duration: 0.3)) {
                    showSheet = true
                }
            }
        }
            
    }
        .sheet(isPresented: $showSheet) {
            MajarParkDescriptionView(fullText: fullText){
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
    }
}



struct MajarParkDescriptionView: View {
    let fullText: String
    @Environment(\.presentationMode) var presentationMode
    var onClose: () -> Void

    var body: some View {
        VStack {
            CloseHeader {
                presentationMode.wrappedValue.dismiss()
            }

            VStack(spacing: 0) {
                Text("Park Description")
                    .font(.system(size: 20, weight: .bold))
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.black)
                    

                ScrollView {
                    Text(fullText)
                        .padding()
                        .font(.body)
                        .foregroundColor(.black)
                }
            }
            .background(Color.white)
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .shadow(radius: 5)
        }
        .background(Color.clear)
        .edgesIgnoringSafeArea(.all)
    }
}


