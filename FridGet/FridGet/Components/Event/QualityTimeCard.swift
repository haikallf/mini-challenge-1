//
//  QualityTimeCard.swift
//  FridGet
//
//  Created by Haikal Lazuardi on 03/05/23.
//

import SwiftUI

struct QualityTimeCard: View {
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 8) {
                EventTag()
                
                Text("Quality time mode")
                    .multilineTextAlignment(.leading)
                    .font(.headline)
                    .fontWeight(.semibold)
                
                Text("This is your chance to bond your friendship, have fun!")
                    .font(.footnote)
            }
            
            Spacer()
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(Color("secondaryBlue"))
        .cornerRadius(8)
        .overlay(
            RoundedRectangle(cornerRadius: 8)
                .stroke(Color("tertiaryBlue"), lineWidth: 0.5)
        )
    }
}

struct QualityTimeCard_Previews: PreviewProvider {
    static var previews: some View {
        QualityTimeCard()
    }
}
