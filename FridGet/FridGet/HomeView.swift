//
//  HomeView.swift
//  FridGet
//
//  Created by Haikal Lazuardi Fadil on 15/04/23.
//

import SwiftUI

struct HomeView: View {
    @Binding var isUserCurrentlyLoggedIn: Bool
    
    var body: some View {
        Text("This is Home")
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(isUserCurrentlyLoggedIn: .constant(false))
    }
}
