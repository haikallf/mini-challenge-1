//
//  ContentView.swift
//  FridGet
//
//  Created by Haikal Lazuardi Fadil on 15/04/23.
//

import SwiftUI

struct ContentView: View {
    @State private var isUserCurrentlyLoggedIn: Bool = false
    
    var body: some View {
        NavigationView {
            VStack {
                if self.isUserCurrentlyLoggedIn {
                    HomeView(isUserCurrentlyLoggedIn: $isUserCurrentlyLoggedIn)
                } else {
                    AuthView(isUserCurrentlyLoggedIn: $isUserCurrentlyLoggedIn)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
