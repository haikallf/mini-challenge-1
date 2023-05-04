//
//  UserCard.swift
//  FridGet
//
//  Created by Haikal Lazuardi on 30/04/23.
//

import SwiftUI

struct UserCard: View {
    var status: String // accepted, rejected, pending, organizer
    var isOwner: Bool = true
    var isArrived: Bool = false
    
    @State var isShowRemoveGuestAlert: Bool = false
    
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
                    
                case "organizer":
                    Text("Organizer")
                        .font(.system(size: 12))
                        .foregroundColor(Color("gray"))
                    
                default:
                    Text("Pending invitation")
                        .font(.system(size: 12))
                        .foregroundColor(Color("brown"))
                }
            }
            
            Spacer()
            
            if (isArrived) {
                Text("Arrived")
                    .padding(.vertical, 4)
                    .padding(.horizontal, 8)
                    .font(.system(size: 11))
                    .foregroundColor(.white)
                    .background(Color("green"))
                    .cornerRadius(1000)
            } else if (status == "pending" && isOwner) {
                Image(systemName: "xmark")
                    .font(.callout)
                    .foregroundColor(Color("secondaryGray"))
                    .onTapGesture {
                        isShowRemoveGuestAlert = true
                    }
            }
        }
        .alert("Remove a guest", isPresented: $isShowRemoveGuestAlert, actions: {
            Button("Cancel", role: .cancel, action: {
                isShowRemoveGuestAlert = false
            })
            
            Button("Remove", role: .destructive, action: {})
            
        }, message: {
            Text("Are you sure you want to remove a guest from the guest list?")
        })
    }
}

struct UserCard_Previews: PreviewProvider {
    static var previews: some View {
        UserCard(status: "accepted", isArrived: true)
    }
}
