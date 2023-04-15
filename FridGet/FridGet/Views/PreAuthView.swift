//
//  PreAuthView.swift
//  FridGet
//
//  Created by Haikal Lazuardi Fadil on 16/04/23.
//

import SwiftUI

struct PreAuthView: View {
    @Binding var isUserCurrentlyLoggedIn: Bool
//    @State var isLogin: Bool = true
    
    var body: some View {
        VStack {
            Rectangle()
                .frame(width: 140, height: 140)
                .foregroundColor(.gray)
                .padding(.bottom, 80)
            
            NavigationLink(destination: AuthView(isUserCurrentlyLoggedIn: $isUserCurrentlyLoggedIn, isLogin: true)) {
                Text("Log In")
                    .frame(maxWidth: .infinity)
                    .foregroundColor(.purple)
                    .padding()
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(.purple, lineWidth: 2)
                    )
                
            }
            .background(.white)
            .cornerRadius(10)
            
            NavigationLink(destination: AuthView(isUserCurrentlyLoggedIn: $isUserCurrentlyLoggedIn, isLogin: false)) {
                Text("Create an Account")
                    .frame(maxWidth: .infinity)
                    .foregroundColor(.white)
                    .padding()
                
            }
            .background(.purple)
            .cornerRadius(10)
        }
        .padding()
    }
}

struct PreAuthView_Previews: PreviewProvider {
    static var previews: some View {
        PreAuthView(isUserCurrentlyLoggedIn: .constant(false))
    }
}
