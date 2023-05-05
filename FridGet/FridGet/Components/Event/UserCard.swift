//
//  UserCard.swift
//  FridGet
//
//  Created by Haikal Lazuardi on 30/04/23.
//

import SwiftUI

struct UserCard: View {
//    var status: String // accepted, rejected, pending, organizer
//    var isOwner: Bool = true
//    var isArrived: Bool = false
    
    var member: ScheduleMember

    
    @StateObject var globalString = GlobalString()
    
    @State var isShowRemoveGuestAlert: Bool = false
    
    var body: some View {
        HStack {
            InitialAvatar(initial: "\(member.member.fullname.components(separatedBy: " ").map { String($0.prefix(1))}.joined().prefix(2))").textCase(.uppercase)
            
            VStack(alignment: .leading, spacing: 4) {
                Text("\(member.member.fullname)")
                    .font(.system(size: 17))
                    .fontWeight(.semibold)
                
                switch member.status_member {
                case "Accepted":
                    Text("Accept the invitation")
                        .font(.system(size: 12))
                        .foregroundColor(Color("green"))
                    
                case "Rejected":
                    Text("Reject the invitation")
                        .font(.system(size: 12))
                        .foregroundColor(Color("red"))
                    
                case "Owner":
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
            
            if (member.status_member == "Arrived") {
                Text("Arrived")
                    .padding(.vertical, 4)
                    .padding(.horizontal, 8)
                    .font(.system(size: 11))
                    .foregroundColor(.white)
                    .background(Color("green"))
                    .cornerRadius(1000)
            } else if (member.schedule.user.fullname == globalString.fullnamelogin && member.status_member != "Owner" && member.schedule.status_schedule != "Success") {
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
        UserCard(member: ScheduleMember(id: 0, schedule: Schedule(id: 0, created_at: "", user: User(email: "", fullname: ""), nama: "", latitude: "", longitude: "", alamat: "", namatempat: "", tanggal: "", waktu: "", status_schedule: "", note: ""), member: User(email: "", fullname: ""), created_at: "", status_member: ""))
    }
}
