//
//  PendingInvitationView.swift
//  FridGet
//
//  Created by Haikal Lazuardi on 29/04/23.
//

import SwiftUI

struct PendingInvitationView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 12) {
                ForEach(1..<10) { idx in
                    EventCard(eventName: "Ini nama eventnya", isPending: true)
                    
                    if (idx != 9) { // last idx or arr.count == 1
                        Divider()
                            .frame(height: 1)
                            .padding(.leading, 12)
                    }
                }
                
                Spacer()
            }
            .padding()
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarTitle(Text("Pending Invitation"))
        }
    }
}

struct PendingInvitationView_Previews: PreviewProvider {
    static var previews: some View {
        PendingInvitationView()
    }
}
