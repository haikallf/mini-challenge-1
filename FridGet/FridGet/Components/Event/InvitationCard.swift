//
//  InvitationCard.swift
//  FridGet
//
//  Created by Haikal Lazuardi on 30/04/23.
//

import SwiftUI

struct InvitationCard: View {
//    var ownerName: String = "Satria"
//    var isPending: Bool = false
    
    var member: ScheduleMember
    
    var body: some View {
        VStack {
            HStack(alignment: .top) {
                InitialAvatar(initial: "\(member.schedule.user.fullname.components(separatedBy: " ").map { String($0.prefix(1))}.joined().prefix(2))").textCase(.uppercase)
                
                
                VStack(alignment: .leading) {
                    Text("\(member.schedule.user.fullname) has invited you to an event")
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
                            Image(systemName: "xmark.circle.fill")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 28)
                                .foregroundColor(Color("lightRed"))
                        }
                        
                        Button(action: {}) {
                            Image(systemName: "checkmark.circle.fill")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 28)
                                .foregroundColor(Color("lightGreen"))
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
        InvitationCard(member: ScheduleMember(id: 0, schedule: Schedule(id: 0, created_at: "", user: User(email: "", fullname: ""), nama: "", latitude: "", longitude: "", alamat: "", namatempat: "", tanggal: "", waktu: "", status_schedule: "", note: ""), member: User(email: "", fullname: ""), created_at: "", status_member: ""))
    }
}
