//
//  CustomButton.swift
//  FridGet
//
//  Created by Haikal Lazuardi on 16/04/23.
//

import SwiftUI

struct CustomButton: View {
    var text: String
    var action: () -> Void
    var isBordered: Bool
    var width: Double = .infinity
    var color: Color = .purple
    
    var body: some View {
        if (isBordered) {
            Button(action: action) {
                Text(text)
                    .frame(maxWidth: width)
                    .foregroundColor(color)
                    .padding()
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(color, lineWidth: 2)
                    )
            }
            .background(.white)
            .cornerRadius(10)
        } else {
            Button(action: action) {
                Text(text)
                    .frame(maxWidth: width)
                    .foregroundColor(.white)
                    .padding()
            }
            .background(color)
            .cornerRadius(10)
        }
    }
}

struct CustomButton_Previews: PreviewProvider {
    static var previews: some View {
        CustomButton(text: "Button", action: { print("Button Clicked") }, isBordered: false)
    }
}
