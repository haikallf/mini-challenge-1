//
//  EventOverCard.swift
//  FridGet
//
//  Created by Haikal Lazuardi on 03/05/23.
//

import SwiftUI

struct EventOverCard: View {
    var member: ScheduleMember
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 8) {
                EventTag(member: member)
                
                Text("Cheers to a joyful time with friends!")
                    .multilineTextAlignment(.leading)
                    .font(.headline)
                    .fontWeight(.semibold)
                
                Text("You earn total of ")
                    .font(.footnote)
                + Text("10 bonding points")
                    .font(.footnote)
                    .fontWeight(.bold)
                    .foregroundColor(Color("yellow"))
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

struct EventOverCard_Previews: PreviewProvider {
    static var previews: some View {
        EventOverCard(member: ScheduleMember(id: 0, schedule: Schedule(id: 0, created_at: "", user: User(email: "", fullname: ""), nama: "", latitude: "", longitude: "", alamat: "", namatempat: "", tanggal: "", waktu: "", status_schedule: "", note: ""), member: User(email: "", fullname: ""), created_at: "", status_member: ""))
    }
}
