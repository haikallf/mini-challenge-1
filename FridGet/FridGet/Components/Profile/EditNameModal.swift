//
//  EditNameModal.swift
//  FridGet
//
//  Created by Haikal Lazuardi on 03/05/23.
//

import SwiftUI

struct EditNameModal: View {
    @Environment(\.dismiss) var dismiss
    
    @State var newName: String
    var currentName: String = "Andini Putri"
    
    init() {
        self._newName = State(initialValue: currentName)
    }
    
    func isNameChanged() -> Bool {
        return newName != currentName
    }
    
    var body: some View {
        ZStack {
            Color("grayBg")
                .ignoresSafeArea()
            
            VStack(alignment: .leading) {
                TextField(currentName, text: $newName)
                    .padding([.leading, .vertical])
                    .background(.white)
                    .cornerRadius(8)
                    .multilineTextAlignment(.leading)
                    .textInputAutocapitalization(.never)
                
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
                Text("Edit Name")
                    .font(.system(size: 17))
                    .fontWeight(.semibold)
                    .foregroundColor(.black)
            }
            
            ToolbarItem(placement: .navigationBarTrailing) {
                Text("Done")
                    .font(.system(size: 17))
                    .fontWeight(.regular)
                    .foregroundColor(isNameChanged() ? .blue : Color("tertiaryGray"))
                    .onTapGesture {
                        dismiss()
                    }
                    .disabled(isNameChanged())
            }
        }
    }
}

struct EditNameModal_Previews: PreviewProvider {
    static var previews: some View {
        EditNameModal()
    }
}
