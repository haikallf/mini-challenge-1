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
    let isBordered: Bool = false
    
    var body: some View {
        Group {
            if(isBordered) {
                NavigationLink(destination: destination) {
                    Text(text)
                        .frame(maxWidth: .infinity)
                        .foregroundColor(.white)
                        .padding()
                    
                }
                .background(.purple)
                .cornerRadius(10)
            } else {
                NavigationLink(destination: destination) {
                    Text(text)
                        .frame(maxWidth: .infinity)
                        .foregroundColor(.white)
                        .padding()
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(.black, lineWidth: 2)
                        )
                    
                }
                .background(.purple)
                .cornerRadius(10)
                
            }
        }
    }
}

//struct NavigationButton_Previews: PreviewProvider {
//    static var previews: some View {
//        NavigationButton()
//    }
//}
