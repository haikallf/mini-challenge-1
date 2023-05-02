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
        VStack {
            Text("Bonding Points")
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
                    .onTapGesture {
                        dismiss()
                    }
            }
        }

    }
}

struct BondingPointsModal_Previews: PreviewProvider {
    static var previews: some View {
        BondingPointsModal()
    }
}
