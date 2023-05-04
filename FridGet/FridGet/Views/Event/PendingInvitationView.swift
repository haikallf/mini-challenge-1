//
//  PendingInvitationView.swift
//  FridGet
//
//  Created by Haikal Lazuardi on 29/04/23.
//

import SwiftUI

struct PendingInvitationView: View {
    var pendingEvents: [String] = []
    @State var isShowNewEventModal: Bool = false
    
    var body: some View {
        Group {
            if (pendingEvents.isEmpty) {
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
                }
            } else {
                VStack(alignment: .center, spacing: 36) {
                    Rectangle()
                        .fill(Color("gray"))
                        .frame(width: 342, height: 283)
                    
                    Text("You don’t have any pending invitation. How about you start inviting your friends?")
                        .font(.callout)
                        .fontWeight(.semibold)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)
                    
                    HStack {
                        Image(systemName: "plus.circle.fill")
                        
                        Text("New Event")
                    }
                    .fontWeight(.semibold)
                    .foregroundColor(.blue)
                    .onTapGesture {
                        isShowNewEventModal.toggle()
                    }
                    .sheet(isPresented: $isShowNewEventModal) {
                        NavigationView {
                            NewEventModal()
                        }
                    }
                }
                .padding()
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarTitle(Text("Pending Invitation"))
    }
}

struct PendingInvitationView_Previews: PreviewProvider {
    static var previews: some View {
        PendingInvitationView()
    }
}
