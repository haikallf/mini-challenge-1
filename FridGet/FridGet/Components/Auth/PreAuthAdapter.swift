//
//  PreAuthAdapter.swift
//  FridGet
//
//  Created by Haikal Lazuardi on 29/04/23.
//

import SwiftUI

struct PreAuthAdapter: View {
    let text: String
    var filename: String
    
    var body: some View {
        VStack(spacing: 32) {
            Text(text)
                .font(.system(size: 22))
                .fontWeight(.bold)
            
            Rectangle()
                .fill(.gray)
                .frame(width: 358, height: 267)
        }
        
    }
}

struct PreAuthAdapter_Previews: PreviewProvider {
    static var previews: some View {
        PreAuthAdapter(text: "Text", filename: "Filename")
    }
}
