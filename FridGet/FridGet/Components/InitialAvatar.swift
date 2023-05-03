//
//  InitialAvatar.swift
//  FridGet
//
//  Created by Haikal Lazuardi on 30/04/23.
//

import SwiftUI

struct InitialAvatar: View {
    var initial: String
    var fontSize: CGFloat = 12
    
    var body: some View {
        Text(initial)
            .font(.system(size: fontSize))
            .padding(.all, 10)
            .background(
                LinearGradient(gradient: Gradient(colors: [Color(red: 188/255, green: 188/255, blue: 188/255),
                                                           Color(red: 134/255, green: 126/255, blue: 128/255)]), startPoint: .top, endPoint: .bottom)
            )
            .foregroundColor(.white)
            .cornerRadius(.infinity)
    }
}

struct InitialAvatar_Previews: PreviewProvider {
    static var previews: some View {
        InitialAvatar(initial: "SJ")
    }
}
