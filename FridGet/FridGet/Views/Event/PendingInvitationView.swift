//
//  PendingInvitationView.swift
//  FridGet
//
//  Created by Haikal Lazuardi on 29/04/23.
//

import SwiftUI

struct PendingInvitationView: View {
    var body: some View {
        VStack {
            EventCard(eventName: "Ini nama eventnya yang misalnya panjang sekali", isPending: true)
            EventCard(eventName: "Ini nama eventnya", isPending: true)
            EventCard(eventName: "Ini nama eventnya", isPending: true)
            EventCard(eventName: "Ini nama eventnya", isPending: true)
            
            Spacer()
        }
        .padding()
        .navigationBarTitle(Text("Pending Invitation"))
    }
}

struct PendingInvitationView_Previews: PreviewProvider {
    static var previews: some View {
        PendingInvitationView()
    }
}
