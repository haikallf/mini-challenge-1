//
//  EventOverCard.swift
//  FridGet
//
//  Created by Haikal Lazuardi on 03/05/23.
//

import SwiftUI

struct EventOverCard: View {
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 8) {
                EventTag(isHappening: false)
                
                Text("Cheers to a joyful time with friends!")
                    .multilineTextAlignment(.leading)
                    .font(.headline)
                    .fontWeight(.semibold)
                
                Text("You earn total of ")
                    .font(.footnote)
                + Text("10 bonding points")
                    .font(.footnote)
                    .fontWeight(.bold)
                    .foregroundColor(Color("yellow"))
            }
            Spacer()
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(Color("secondaryBlue"))
        .cornerRadius(8)
        .overlay(
            RoundedRectangle(cornerRadius: 8)
                .stroke(Color("tertiaryBlue"), lineWidth: 0.5)
        )
    }
}

struct EventOverCard_Previews: PreviewProvider {
    static var previews: some View {
        EventOverCard()
    }
}
