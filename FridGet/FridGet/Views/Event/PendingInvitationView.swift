//
//  PendingInvitationView.swift
//  FridGet
//
//  Created by Haikal Lazuardi on 29/04/23.
//

import SwiftUI

struct PendingInvitationView: View {
    @StateObject var viewModel = ViewModel()
    @State var fullnamelogin: String = "Gaizka Valencia"
    
    var body: some View {
        VStack {
            ScrollView {
                ForEach(viewModel.scheduleMember.filter({$0.member.fullname == fullnamelogin && $0.status_member == "Pending"} ), id:\.self) { item in //filter data before passing to for each
                    EventCard(member: ScheduleMember(id: item.id, schedule: Schedule(id: item.schedule.id, created_at: item.schedule.created_at, user: User(email: item.schedule.user.email, fullname: item.schedule.user.fullname), nama: item.schedule.nama, latitude: item.schedule.latitude, longitude: item.schedule.longitude, alamat: item.schedule.alamat, namatempat: item.schedule.namatempat, tanggal: item.schedule.tanggal, waktu: item.schedule.waktu, status_schedule: item.schedule.status_schedule, note: item.schedule.note), member: User(email: item.member.fullname, fullname: item.member.fullname), created_at: item.created_at, status_member: item.status_member))
                }
//                                    EventCard(eventName: "Ini nama event yang panjanggggggggggggggggg", eventLocation: "The Breeze")
//                                    EventCard(eventName: "Ini nama eventnya", eventLocation: "The Breeze")
//                                    EventCard(eventName: "Ini nama eventnya", eventLocation: "The Breeze")
//                                    EventCard(eventName: "Ini nama eventnya", eventLocation: "The Breeze")
//                                    EventCard(eventName: "Ini nama eventnya", eventLocation: "The Breeze")
//                                    EventCard(eventName: "Ini nama eventnya", eventLocation: "The Breeze")
            }
        }        .task{
            viewModel.loadSchedule()
        }
        .padding()
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarTitle(Text("Pending Invitation"))
    }
}

struct PendingInvitationView_Previews: PreviewProvider {
    static var previews: some View {
        PendingInvitationView()
    }
}
