//
//  ChangePasswordModal.swift
//  FridGet
//
//  Created by Haikal Lazuardi on 03/05/23.
//

import SwiftUI

struct ChangePasswordModal: View {
    @Environment(\.dismiss) var dismiss
    
    @State var currentPassword: String = ""
    @State var newPassword: String = ""
    @State var confirmNewPasssword: String = ""
    
    var userPassword: String = "pass123"
    
    func isAbleToChangePassword() -> Bool {
        return (currentPassword == userPassword && newPassword == confirmNewPasssword && userPassword != newPassword && currentPassword != "" && newPassword != "" && confirmNewPasssword != "")
    }
    
    var body: some View {
        ZStack {
            Color("grayBg")
                .ignoresSafeArea()
            
            VStack(alignment: .leading) {
                SecureInputField("Current password", text: $currentPassword)
                    .padding(.leading)
                    .padding(.vertical, 11)
                    .background(.white)
                    .cornerRadius(8)
                    .multilineTextAlignment(.leading)
                
                VStack {
                    SecureInputField("New password", text: $newPassword)
                    
                    Divider()
                    
                    SecureInputField("Confirm pew password", text: $confirmNewPasssword)
                }
                .padding(.leading)
                .padding(.vertical, 11)
                .background(.white)
                .cornerRadius(8)
                .multilineTextAlignment(.leading)
                
                Spacer()
            }
            .padding()
        }
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Text("Cancel")
                    .font(.system(size: 17))
                    .fontWeight(.regular)
                    .foregroundColor(.blue)
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
                    .foregroundColor(isAbleToChangePassword() ? .blue : Color("gray"))
                    .onTapGesture {
                        dismiss()
                    }
                    .disabled(!isAbleToChangePassword())
            }
        }

    }
}

struct ChangePasswordModal_Previews: PreviewProvider {
    static var previews: some View {
        ChangePasswordModal()
    }
}
