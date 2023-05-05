//
//  ArrivedConfirmationCard.swift
//  FridGet
//
//  Created by Haikal Lazuardi on 03/05/23.
//

import SwiftUI

struct ArrivedConfirmationCard: View {
    var action: () -> Void
    
    var member: ScheduleMember
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            EventTag(member: member)
            
            Text("Have you arrived at the event location?")
                .multilineTextAlignment(.leading)
                .font(.headline)
                .fontWeight(.semibold)
            
            HStack {
                Spacer()
                
                CustomButton(text: "I'm here", action: {
                    action()
                }, isPrimary: false, width: 106)
                    .padding(.top)
                
            }
        }
        .padding()
        .background(Color("secondaryBlue"))
        .cornerRadius(8)
        .overlay(
            RoundedRectangle(cornerRadius: 8)
                .stroke(Color("tertiaryBlue"), lineWidth: 0.5)
        )
    }
}

struct ArrivedConfirmationCard_Previews: PreviewProvider {
    static var previews: some View {
        ArrivedConfirmationCard(action: {}, member: ScheduleMember(id: 0, schedule: Schedule(id: 0, created_at: "", user: User(email: "", fullname: ""), nama: "", latitude: "", longitude: "", alamat: "", namatempat: "", tanggal: "", waktu: "", status_schedule: "", note: ""), member: User(email: "", fullname: ""), created_at: "", status_member: ""))
    }
}
