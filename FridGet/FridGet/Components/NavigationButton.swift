//
//  NavigationButton.swift
//  FridGet
//
//  Created by Haikal Lazuardi Fadil on 28/04/23.
//

import SwiftUI

struct NavigationButton<Destination: View>: View {
    let destination: Destination
    let text: String
    var isSecondary: Bool = false
    let maxWidth: CGFloat = .infinity
    
    var body: some View {
        Group {
            if(isSecondary) {
                NavigationLink(destination: destination) {
                    Text(text)
                        .fontWeight(.semibold)
                        .frame(maxWidth: maxWidth)
                        .foregroundColor(.blue)
                        .padding()
                        .overlay(
                            RoundedRectangle(cornerRadius: 1000)
                                .stroke(.white, lineWidth: 2)
                        )
                    
                }
                .background(.white)
                .cornerRadius(1000)
            } else {
                NavigationLink(destination: destination) {
                    Text(text)
                        .font(.system(size: 17))
                        .fontWeight(.semibold)
                        .frame(maxWidth: maxWidth)
                        .foregroundColor(.white)
                        .padding()
                }
                .background(.blue)
                .cornerRadius(1000)
                
            }
        }
    }
}

//struct NavigationButton_Previews: PreviewProvider {
//    static var previews: some View {
//        NavigationButton()
//    }
//}
