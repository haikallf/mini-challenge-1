//
//  EmailTag.swift
//  FridGet
//
//  Created by Haikal Lazuardi on 03/05/23.
//

import SwiftUI

struct EmailTag: View {
    var email: String
    var action: () -> Void
    
    var body: some View {
        HStack {
            Text(email)
                .foregroundColor(.blue)
            
            Image(systemName: "xmark.circle.fill")
                .foregroundColor(Color("secondaryGray"))
                .onTapGesture {
                    action()
                }
        }
        .padding(.vertical, 4)
        .padding(.horizontal, 8)
        .font(.system(size: 13))
        .background(Color("grayBg"))
        .cornerRadius(4)
    }
}

struct EmailTag_Previews: PreviewProvider {
    static var previews: some View {
        EmailTag(email: "haikal@email.com", action: {})
    }
}
