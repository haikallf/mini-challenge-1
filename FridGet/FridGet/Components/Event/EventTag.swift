//
//  EventTag.swift
//  FridGet
//
//  Created by Haikal Lazuardi on 03/05/23.
//

import SwiftUI

struct EventTag: View {
    var isHappening = true
    
    var body: some View {
        if (isHappening) {
            HStack {
                Image(systemName: "dot.radiowaves.left.and.right")
                Text("Happening Now")
            }
            .font(.system(size: 11))
            .padding(.vertical, 4)
            .padding(.horizontal, 8)
            .foregroundColor(.white)
            .background(.red)
            .cornerRadius(1000)
        } else {
            HStack {
                Image(systemName: "hands.sparkles.fill")
                Text("Quality Time Spent")
            }
            .font(.system(size: 11))
            .padding(.vertical, 4)
            .padding(.horizontal, 8)
            .foregroundColor(.black)
            .background(Color("yellow"))
            .cornerRadius(1000)
        }
    }
}

struct EventTag_Previews: PreviewProvider {
    static var previews: some View {
        EventTag()
    }
}
