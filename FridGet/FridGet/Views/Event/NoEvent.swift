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
                Rectangle()
                    .fill(.gray)
                    .frame(width: 358, height: 283)
                
                Text("It looks like you never have any hangout event so far. Start planning now!")
                    .font(.system(size: 16))
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
            } else {
                Rectangle()
                    .fill(.gray)
                    .frame(width: 358, height: 283)
                
                Text("Ready to bond with your friends? Start planning your next hangout now!")
                    .font(.system(size: 16))
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
            }
        }
    }
}

struct NoEvent_Previews: PreviewProvider {
    static var previews: some View {
        NoEvent(isOngoing: 1)
    }
}
