//
//  FloatingTextFieldOtp.swift
//  Ticketing App
//
//  Created by nikhil tiwari on 05/04/25.
//

import SwiftUI

struct FloatingTextFieldOtp: View {
    let textFieldHeight: CGFloat = 46
    private let placeHolderText: String
    @Binding var text: String
    @State private var isEditing = false
    @State private var isSecure = true // State for toggling secure text entry
    private let showEyeIcon: Bool // Determines if the eye icon is shown
    
    // Public initializer
    public init(placeHolder: String, text: Binding<String>, showEyeIcon: Bool = false) {
        self._text = text
        self.placeHolderText = placeHolder
        self.showEyeIcon = showEyeIcon
    }
    
    // Placeholder should move when editing or text is not empty
    var shouldPlaceHolderMove: Bool {
        isEditing || !text.isEmpty
    }

    var body: some View {
        VStack {
            ZStack(alignment: .leading) {
                HStack {
                    if showEyeIcon && isSecure {
                        SecureField("", text: $text)
                            .keyboardType(.numberPad) // Set keyboard type
                            .onTapGesture {
                                isEditing = true
                            }
                            .onChange(of: text) { newValue in
                                text = newValue.filter { $0.isNumber }
                                if text.count > 4 {
                                    text = String(text.prefix(4))
                                }
                                
                                if text.count == 4 {
                                    dismissKeyboard()
                                }
                            }
                    } else {
                        TextField("", text: $text, onEditingChanged: { edit in
                            isEditing = edit
                        })
                        .keyboardType(.numberPad) // Set keyboard type
                        .onChange(of: text) { newValue in
                            text = newValue.filter { $0.isNumber }
                            if text.count > 4 {
                                text = String(text.prefix(4))
                            }
                            
                            if text.count == 4 {
                                dismissKeyboard()
                            }
                        }
                    }
                    
                    if showEyeIcon {
                        Button(action: {
                            isSecure.toggle()
                        }) {
                            Image(systemName: isSecure ? "eye.slash" : "eye")
                                .foregroundColor(.secondary)
                        }
                    }
                }
                .padding(.horizontal)
                .frame(height: textFieldHeight)
                .background(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.secondary, lineWidth: 1)
                )
                .foregroundColor(Color.primary)
                .accentColor(Color.secondary)
                
                // Floating placeholder
                Text(placeHolderText)
                    .foregroundColor(.gray)
                    .bold()
                    .background(Color.white)
                    .padding(.horizontal, 10)
                    .padding(.vertical, 2)
                    .scaleEffect(shouldPlaceHolderMove ? 0.8 : 1.0, anchor: .leading)
                    .offset(y: shouldPlaceHolderMove ? -textFieldHeight / 2 : 0)
                    .animation(.easeInOut(duration: 0.2), value: shouldPlaceHolderMove)
                    .allowsHitTesting(false) // Disable interaction for placeholder
                    
            }
        }
    }

    private func dismissKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

