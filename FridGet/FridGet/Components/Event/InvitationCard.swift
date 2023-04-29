//
//  InvitationCard.swift
//  FridGet
//
//  Created by Haikal Lazuardi on 30/04/23.
//

import SwiftUI

struct InvitationCard: View {
    var ownerName: String = "Satria"
    var isPending: Bool = false
    
    var body: some View {
        VStack {
            HStack(alignment: .top) {
                InitialAvatar(initial: "SJ")
                
                VStack(alignment: .leading) {
                    Text("\(ownerName) has invited you to an event")
                        .foregroundColor(.black)
                        .font(.system(size: 16))
                        .fontWeight(.semibold)
                        .multilineTextAlignment(.leading)
                    
                    Text("Do you want to accept this invitation?")
                        .foregroundColor(Color("gray"))
                        .font(.system(size: 11))
                }
                
                Spacer()
                
                
                VStack {
                    Spacer()
                    
                    HStack {
                        Button(action: {}) {
                            Image(systemName: "x.circle.fill")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 28)
                                .foregroundColor(Color("gray"))
                        }
                        
                        Button(action: {}) {
                            Image(systemName: "checkmark.circle.fill")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 28)
                                .foregroundColor(Color("gray"))
                        }
                    }
                    
                    Spacer()
                }
            }
            .padding()
            .frame(maxHeight: 100)
            .cornerRadius(8)
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color("grayBg"), lineWidth: 1)
        )
        }
    }
}

struct InvitationCard_Previews: PreviewProvider {
    static var previews: some View {
        InvitationCard()
    }
}
