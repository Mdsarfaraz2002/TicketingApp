//
//  SideMenuHeaderView.swift
//  Ticketing App
//
//  Created by nikhil tiwari on 08/04/25.
//


import SwiftUI

struct SideMenuHeaderView: View {
   // @StateObject private var viewModel = RegistrationViewModel()
    @State private var name : String = ""
    @State private var email : String = ""
    @State private var mobile : String = ""
    var body: some View {
        ZStack {
            VStack {
                
                Image("Mask Group_image 1")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 100, height: 100)
                    .overlay(
                        RoundedRectangle(cornerRadius: 50)
                            .stroke(.purple.opacity(0.5), lineWidth: 10)
                    )
                    .cornerRadius(50)
                
                
                    Text("Mohammad Sarfaraz")
              
                
                    .font(.system(size: 18, weight: .bold))
                    .foregroundColor(.black)
                
                Text("IOS Developer")
                    .font(.system(size: 14, weight: .semibold))
                    .foregroundColor(.black.opacity(0.5))
                
            }
        }
    }
}

