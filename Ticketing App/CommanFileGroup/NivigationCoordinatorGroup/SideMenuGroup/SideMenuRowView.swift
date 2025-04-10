//
//  SideMenuRowView.swift
//  Ticketing App
//
//  Created by nikhil tiwari on 08/04/25.
//

import SwiftUI

struct SideMenuRowView: View {
    var option: SideMenuOptionDataMedel
    
    @Binding var selectedOption: SideMenuOptionDataMedel?
    
    private var isSelected: Bool{
        return selectedOption == option
    }
    
    var body: some View {
        HStack {
            Image(systemName: option.systemImageName)
                .imageScale(.medium)
            
            Text(option.title)
                .font(.system(size: 16))
                .bold()
            
            Spacer()
        }
        .padding(.leading)
        .foregroundStyle(isSelected ? .black: .primary)
        .frame(width: 216,height: 44)
        .background(isSelected ? .blue.opacity(0.25): .clear)
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .padding(.horizontal)
        
    }
}
