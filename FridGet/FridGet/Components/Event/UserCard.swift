//
//  UserCard.swift
//  FridGet
//
//  Created by Haikal Lazuardi on 30/04/23.
//

import SwiftUI

struct UserCard: View {
//    var status: String // accepted, rejected, pending
    
    var member: ScheduleMember
    
//    var member : ScheduleMember
//    var user: User
    
    
    var body: some View {
        HStack {
            InitialAvatar(initial: "\(member.member.fullname.components(separatedBy: " ").map { String($0.prefix(1))}.joined().prefix(2))").textCase(.uppercase)
            
            VStack(alignment: .leading, spacing: 4) {
                Text(member.member.fullname)
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
        UserCard(member: ScheduleMember(id: 0, schedule: Schedule(id: 0, created_at: "", user: User(email: "", fullname: ""), nama: "", latitude: "", longitude: "", alamat: "", namatempat: "", tanggal: "", waktu: "", status_schedule: "", note: ""), member: User(email: "", fullname: ""), created_at: "", status_member: ""))
    }
}
