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
    var isPrimary: Bool
    var width: Double = .infinity
    
    var body: some View {
        if (!isPrimary) {
            Button(action: action) {
                Text(text)
                    .padding()
                    .frame(maxWidth: width)
                    .foregroundColor(.blue)
                    .fontWeight(.semibold)
            }
            .background(.white)
            .cornerRadius(1000)
        } else {
            Button(action: action) {
                Text(text)
                    .font(.system(size: 17))
                    .fontWeight(.semibold)
                    .frame(maxWidth: width)
                    .foregroundColor(.white)
                    .padding()
            }
            .background(.blue)
            .cornerRadius(1000)
        }
    }
}

struct CustomButton_Previews: PreviewProvider {
    static var previews: some View {
        CustomButton(text: "Button", action: { print("Button Clicked") }, isPrimary: true)
    }
}
