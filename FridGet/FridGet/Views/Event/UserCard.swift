//
//  UserCard.swift
//  FridGet
//
//  Created by Haikal Lazuardi on 30/04/23.
//

import SwiftUI

struct UserCard: View {
    var status: String // accepted, rejected, pending
    
    var body: some View {
        HStack { 
            InitialAvatar(initial: "HA")
            
            VStack(alignment: .leading, spacing: 4) {
                Text("Haikal")
                    .font(.system(size: 17))
                    .fontWeight(.semibold)
                
                switch status {
                case "accepted":
                    Text("Accept the invitation")
                        .font(.system(size: 12))
                        .foregroundColor(Color("green"))
                    
                case "rejected":
                    Text("Reject the invitation")
                        .font(.system(size: 12))
                        .foregroundColor(Color("red"))
                    
                default:
                    Text("Pending invitation")
                        .font(.system(size: 12))
                        .foregroundColor(Color("yellow"))
                }
            }
            
            Spacer()
        }
    }
}

struct UserCard_Previews: PreviewProvider {
    static var previews: some View {
        UserCard(status: "pending")
    }
}
