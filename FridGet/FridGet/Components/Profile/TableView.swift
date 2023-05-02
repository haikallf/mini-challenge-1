//
//  TableView.swift
//  FridGet
//
//  Created by Haikal Lazuardi on 03/05/23.
//

import SwiftUI

struct TableView: View {
    var iconName: String? // sparkles, lock, trash
    var text: String
    
    var body: some View {
        HStack {           
            Group {
                switch (iconName) {
                case "sparkles":
                    Image(systemName: "sparkles")
                        .padding()
                        .background(Color("purple"))
                case "lock":
                    Image(systemName: "lock.fill")
                        .padding()
                        .background(Color("orange"))
                case "trash":
                    Image(systemName: "trash.fill")
                        .padding()
                        .background(Color("pink"))
                    
                default:
                    Rectangle()
                        .fill(Color("gray"))
                }
            }
            .foregroundColor(.white)
            .frame(width: 30, height: 30)
            .cornerRadius(7)
            
            Text(text)
                .padding(.leading)
            
            Spacer()
            
            Image(systemName: "chevron.right")
                .foregroundColor(Color("secondaryGray"))
        }
        .padding(.horizontal)
    }
}

struct TableView_Previews: PreviewProvider {
    static var previews: some View {
        TableView(iconName: "sparkles", text: "TableView")
    }
}
