//
//  ChangeNameModal.swift
//  FridGet
//
//  Created by Haikal Lazuardi on 03/05/23.
//

import SwiftUI

struct ChangeNameModal: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack {
            Text("Change Name")
        }
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Text("Cancel")
                    .font(.system(size: 17))
                    .fontWeight(.regular)
                    .onTapGesture {
                        dismiss()
                    }
            }
            
            ToolbarItem(placement: .principal) {
                Text("Change Name")
                    .font(.system(size: 17))
                    .fontWeight(.semibold)
                    .foregroundColor(.black)
            }
            
            ToolbarItem(placement: .navigationBarTrailing) {
                Text("Done")
                    .font(.system(size: 17))
                    .fontWeight(.regular)
                    .onTapGesture {
                        dismiss()
                    }
            }
        }
    }
}

struct ChangeNameModal_Previews: PreviewProvider {
    static var previews: some View {
        ChangeNameModal()
    }
}
