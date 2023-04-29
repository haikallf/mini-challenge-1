//
//  SecureInputField.swift
//  FridGet
//
//  Created by Haikal Lazuardi Fadil on 16/04/23.
//

import SwiftUI

struct SecureInputField: View {
    
    @Binding private var text: String
    @State private var isSecured: Bool = true
    private var title: String
    
    init(_ title: String, text: Binding<String>) {
        self.title = title
        self._text = text
    }
    
    var body: some View {
        VStack {
            ZStack(alignment: .trailing) {
                Group {
                    if isSecured {
                        SecureField(title, text: $text)
                    } else {
                        TextField(title, text: $text)
                    }
                }
                .textInputAutocapitalization(.never)
                .padding([.vertical], 6)
                .padding(.trailing, 40)

                Button(action: {
                    isSecured.toggle()
                }) {
                    Image(systemName: self.isSecured ? "eye.slash" : "eye")
                        .accentColor(.gray)
                        .padding(.trailing)
                }
            }
            
            Divider()
             .frame(height: 1)
             .padding(.horizontal, 30)
             .background(Color("secondaryGray"))
        }
    }
}
struct SecureInputField_Previews: PreviewProvider {
    static var previews: some View {
        SecureInputField("Password", text: .constant(""))
    }
}
