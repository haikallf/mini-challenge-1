//
//  InitialAvatar.swift
//  FridGet
//
//  Created by Haikal Lazuardi on 30/04/23.
//

import SwiftUI

struct InitialAvatar: View {
    var initial: String
    
    var body: some View {
        Text(initial)
            .font(.system(size: 12))
            .padding(.all, 10)
            .background(.gray)
            .foregroundColor(.white)
            .cornerRadius(.infinity)
    }
}

struct InitialAvatar_Previews: PreviewProvider {
    static var previews: some View {
        InitialAvatar(initial: "SJ")
    }
}