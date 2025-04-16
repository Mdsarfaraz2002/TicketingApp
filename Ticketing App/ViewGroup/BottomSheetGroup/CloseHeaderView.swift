//
//  CloseHeaderView.swift
//  Ticketing App
//
//  Created by Mohd Sarfaraz on 11/04/25.
//

import SwiftUI

struct CloseHeaderView: View {
    var action: () -> Void

    var body: some View {
        HStack(alignment: .center) {
            Spacer()
            Button(action: action) {
                Image(systemName: "xmark")
                    .font(.system(size: 20, weight: .bold))
                    .padding(12)
                    .background(Color.white.opacity(0.4))
                    .foregroundColor(.white)
                    .clipShape(Circle())
            }
            .frame(maxWidth: .infinity, alignment: .center)
            .padding(.top, 16)
        }
    }
}

struct CloseHeader: View {
    var action: () -> Void

    var body: some View {
        HStack(alignment: .center) {
            Spacer()
            Button(action: action) {
                Image(systemName: "xmark")
                    .font(.system(size: 20, weight: .bold))
                    .padding(12)
                    .background(Color.black.opacity(0.6))
                    .foregroundColor(.white)
                    .clipShape(Circle())
            }
            .frame(maxWidth: .infinity, alignment: .center)
            .padding(.top, 16)
        }
    }
}
