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
        TextField(title, text: $text)
            .textInputAutocapitalization(.never)
            .padding()
            .overlay(RoundedRectangle(cornerRadius: 10.0).strokeBorder(Color.black, style: StrokeStyle(lineWidth: 0.5)))
    }
}

struct TextInputField_Previews: PreviewProvider {
    static var previews: some View {
        TextInputField("Email", text: .constant(""))
    }
}
