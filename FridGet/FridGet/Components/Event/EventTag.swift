//
//  EventTag.swift
//  FridGet
//
//  Created by Haikal Lazuardi on 03/05/23.
//

import SwiftUI

struct EventTag: View {
    var isHappening = true
    
    var member : ScheduleMember
    
    var body: some View {
        if (member.schedule.status_schedule == "Ongoing") {
            HStack {
                Image(systemName: "dot.radiowaves.left.and.right")
                Text("Happening Now")
            }
            .font(.system(size: 11))
            .padding(.vertical, 4)
            .padding(.horizontal, 8)
            .foregroundColor(.white)
            .background(.red)
            .cornerRadius(1000)
        } else {
            HStack {
                Image(systemName: "hands.sparkles.fill")
                Text("Quality Time Spent")
            }
            .font(.system(size: 11))
            .padding(.vertical, 4)
            .padding(.horizontal, 8)
            .foregroundColor(.black)
            .background(Color("yellow"))
            .cornerRadius(1000)
        }
    }
}

struct EventTag_Previews: PreviewProvider {
    static var previews: some View {
        EventTag(member: ScheduleMember(id: 0, schedule: Schedule(id: 0, created_at: "", user: User(email: "", fullname: ""), nama: "", latitude: "", longitude: "", alamat: "", namatempat: "", tanggal: "", waktu: "", status_schedule: "", note: ""), member: User(email: "", fullname: ""), created_at: "", status_member: ""))
    }
}
