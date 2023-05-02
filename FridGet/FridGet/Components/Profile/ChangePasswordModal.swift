//
//  ChangePasswordModal.swift
//  FridGet
//
//  Created by Haikal Lazuardi on 03/05/23.
//

import SwiftUI

struct ChangePasswordModal: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack {
            Text("Change Password")
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
                Text("Change Password")
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

struct ChangePasswordModal_Previews: PreviewProvider {
    static var previews: some View {
        ChangePasswordModal()
    }
}
