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
            PreAuthCarousel()
            VStack(spacing: 16) {
                NavigationButton(destination: AuthView(isUserCurrentlyLoggedIn: $isUserCurrentlyLoggedIn, isLogin: false), text: "Create account")
                
                NavigationButton(destination: AuthView(isUserCurrentlyLoggedIn: $isUserCurrentlyLoggedIn, isLogin: true), text: "Log in", isSecondary: true)

            }
        }
        .padding()
    }
}

struct PreAuthView_Previews: PreviewProvider {
    static var previews: some View {
        PreAuthView(isUserCurrentlyLoggedIn: .constant(false))
    }
}
