//
//  TextInputField.swift
//  FridGet
//
//  Created by Haikal Lazuardi on 16/04/23.
//

import SwiftUI

struct TextInputField: View {
    @Binding private var text: String
    private var title: String
    
    init(_ title: String, text: Binding<String>) {
        self.title = title
        self._text = text
    }
    
    var body: some View {
        VStack {
            TextField(title, text: $text)
                .textInputAutocapitalization(.never)
                .padding([.vertical], 1)
                .multilineTextAlignment(.leading)
            
            Divider()
             .frame(height: 1)
             .padding(.horizontal, 30)
             .background(Color("secondaryGray"))
        }
    }
}

struct TextInputField_Previews: PreviewProvider {
    static var previews: some View {
        TextInputField("Email", text: .constant(""))
    }
}
