//
//  PendingInvitationView.swift
//  FridGet
//
//  Created by Haikal Lazuardi on 29/04/23.
//

import SwiftUI

struct PendingInvitationView: View {
    @StateObject var viewModel = ViewModel()
    @StateObject var globalString = GlobalString()
    
    @State var isShowNewEventModal: Bool = false
    
    var body: some View {
        VStack {
            if (viewModel.scheduleMember.filter({$0.member.fullname == globalString.fullnamelogin && $0.status_member == "Pending"} ).count != 0) {
                ScrollView {
                    ForEach(viewModel.scheduleMember.filter({$0.member.fullname == globalString.fullnamelogin && $0.status_member == "Pending"} ), id:\.self) { item in //filter data before passing to for each
                        EventCard(member: ScheduleMember(id: item.id, schedule: Schedule(id: item.schedule.id, created_at: item.schedule.created_at, user: User(email: item.schedule.user.email, fullname: item.schedule.user.fullname), nama: item.schedule.nama, latitude: item.schedule.latitude, longitude: item.schedule.longitude, alamat: item.schedule.alamat, namatempat: item.schedule.namatempat, tanggal: item.schedule.tanggal, waktu: item.schedule.waktu, status_schedule: item.schedule.status_schedule, note: item.schedule.note), member: User(email: item.member.fullname, fullname: item.member.fullname), created_at: item.created_at, status_member: item.status_member))
                    }
    //                                    EventCard(eventName: "Ini nama event yang panjanggggggggggggggggg", eventLocation: "The Breeze")
    //                                    EventCard(eventName: "Ini nama eventnya", eventLocation: "The Breeze")
    //                                    EventCard(eventName: "Ini nama eventnya", eventLocation: "The Breeze")
    //                                    EventCard(eventName: "Ini nama eventnya", eventLocation: "The Breeze")
    //                                    EventCard(eventName: "Ini nama eventnya", eventLocation: "The Breeze")
    //                                    EventCard(eventName: "Ini nama eventnya", eventLocation: "The Breeze")
                }
            } else {
                VStack(alignment: .center, spacing: 36) {
                    Rectangle()
                        .fill(Color("gray"))
                        .frame(width: 342, height: 283)
                    
                    Text("You don’t have any pending invitation. How about you create new event and start inviting your friends?")
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
        }        .task{
            viewModel.loadSchedule()
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
