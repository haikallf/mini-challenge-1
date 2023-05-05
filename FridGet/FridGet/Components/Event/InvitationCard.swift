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
    
    let member: ScheduleMember
    
    var body: some View {
        VStack {
            HStack(alignment: .top) {
                InitialAvatar(initial: "\(member.schedule.user.fullname.prefix(2))")
                
                VStack(alignment: .leading) {
//                    let _ = print("member schedule1 \(member)")
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
        InvitationCard(member: ScheduleMember(id: 0, schedule: Schedule(id: 0, created_at: "", user: User(email: "", fullname: ""), nama: "", latitude: "", longitude: "", alamat: "", namatempat: "", tanggal: "", waktu: "", status_schedule: "", note: ""), member: User(email: "", fullname: ""), created_at: "", status_member: ""))
    }
}
