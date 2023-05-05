//
//  NoEvent.swift
//  FridGet
//
//  Created by Haikal Lazuardi on 29/04/23.
//

import SwiftUI

struct NoEvent: View {
    var isOngoing: Int
    var body: some View {
        VStack(spacing: 36) {
            if (isOngoing == 0) {               
                Image("history-empty")
                    .frame(width: 232)
                    .aspectRatio(contentMode: .fit)
                    .padding(.top, 80)
                
                Text("It looks like you never have any hangout event so far. Start planning now!")
                    .font(.system(size: 16))
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
            } else {
                Image("on-going-empty")
                    .frame(width: 232)
                    .aspectRatio(contentMode: .fit)
                    .padding(.top, 50)
                
                Text("Ready to bond with your friends? Start planning your next hangout now!")
                    .font(.system(size: 16))
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
            }
            
            Spacer()
        }
        .padding(.horizontal, 24)
    }
}

struct NoEvent_Previews: PreviewProvider {
    static var previews: some View {
        NoEvent(isOngoing: 1)
    }
}
