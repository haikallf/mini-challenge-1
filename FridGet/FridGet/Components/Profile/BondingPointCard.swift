//
//  BondingPointCard.swift
//  FridGet
//
//  Created by Haikal Lazuardi on 03/05/23.
//

import SwiftUI

struct BondingPointCard: View {
    let standings: Int
    
    func getEventTagColor() -> Color {
        switch (standings) {
        case 1:
            return Color("yellow")
            
        case 2:
            return Color("gray")
            
        case 3:
            return Color("brown")
            
        default:
            return .white
        }
    }
    
    var body: some View {
        HStack {
            InitialAvatar(initial: "HA", fontSize: 12)
            
            VStack(alignment: .leading){
                Text("Haikal")
                    .font(.body)
                    .fontWeight(.bold)
                
                Text("\(35) Bonding Points")
                    .font(.caption)
                    .foregroundColor(Color("purple"))
            }
            
            Spacer()
            
            Text("\(7) Events")
                .padding(.vertical, 4)
                .padding(.horizontal, 8)
                .background(getEventTagColor())
                .cornerRadius(1000)
                .font(.caption2)
                .foregroundColor(standings == 2 || standings == 3 ? .white : .black)
        }
    }
}

struct BondingPointCard_Previews: PreviewProvider {
    static var previews: some View {
        BondingPointCard(standings: 1)
    }
}
