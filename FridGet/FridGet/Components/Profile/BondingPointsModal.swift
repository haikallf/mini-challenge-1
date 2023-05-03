//
//  BondingPointsModal.swift
//  FridGet
//
//  Created by Haikal Lazuardi on 03/05/23.
//

import SwiftUI

struct BondingPointsModal: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ScrollView {
            VStack {
                VStack(alignment: .leading) {
                    Text("Your Treasure Trove")
                        .font(.title2)
                        .fontWeight(.bold)
                    
                    Text("Take a look at your bonding journey while cherish the moments you capture with your friends.")
                        .font(.subheadline)
                        .multilineTextAlignment(.leading)
                }
                .padding(.vertical, 32)
                .padding(.horizontal)
                
                VStack(spacing: 20) {
                    // idx, elmt
                    ForEach(1..<20) { idx in
                        HStack {
                            Text("\(idx).")
                                .font(.callout)
                                .fontWeight(.semibold)
                                .frame(maxWidth: 30)
                            
                            BondingPointCard(standings: idx)
                        }
                        .padding(.horizontal)
                    }
                }
                
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("Bonding Points")
                        .font(.system(size: 17))
                        .fontWeight(.semibold)
                        .foregroundColor(.black)
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Text("Close")
                        .font(.system(size: 17))
                        .fontWeight(.regular)
                        .foregroundColor(.blue)
                        .onTapGesture {
                            dismiss()
                        }
                }
            }
        }
        .interactiveDismissDisabled(true)
    }
}

struct BondingPointsModal_Previews: PreviewProvider {
    static var previews: some View {
        BondingPointsModal()
    }
}
