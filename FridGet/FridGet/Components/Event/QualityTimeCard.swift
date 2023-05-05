//
//  QualityTimeCard.swift
//  FridGet
//
//  Created by Haikal Lazuardi on 03/05/23.
//

import SwiftUI

struct QualityTimeCard: View {
    var member: ScheduleMember
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 8) {
                EventTag(member: member)
                
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
        QualityTimeCard(member: ScheduleMember(id: 0, schedule: Schedule(id: 0, created_at: "", user: User(email: "", fullname: ""), nama: "", latitude: "", longitude: "", alamat: "", namatempat: "", tanggal: "", waktu: "", status_schedule: "", note: ""), member: User(email: "", fullname: ""), created_at: "", status_member: ""))
    }
}
