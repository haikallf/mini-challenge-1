//
//  EventView.swift
//  FridGet
//
//  Created by Haikal Lazuardi on 29/04/23.
//

import SwiftUI

struct EventView: View {
    @State private var isOngoing: Int = 1
    @State private var isPendingInvitation: Bool = true
    @State private var isAvailableHistory: Bool = false
    @State private var isAvailableOngoing: Bool = true
    @State var universalSize = UIScreen.main.bounds
    @State private var showModal = false
    
    @StateObject var globalString = GlobalString()
    
    @Binding var isUserCurrentlyLoggedIn: Bool
    @StateObject var viewModel = ViewModel()
    
    var body: some View {
        HStack {
            Text("Events")
                .font(.system(size: 34))
                .fontWeight(.bold)

            Spacer()
            
            NavigationLink(destination: ProfileView()) {
                InitialAvatar(initial: "\(globalString.fullnamelogin.components(separatedBy: " ").map { String($0.prefix(1))}.joined().prefix(2))",fontSize: 20, size: 45).textCase(.uppercase)
            }
        }
        .padding(.top, 44)
        .padding(.horizontal)
        
        VStack(spacing: 16) {
            Picker("", selection: $isOngoing){
                Text("History").tag(0)
                Text("Ongoing").tag(1)
            }
            .pickerStyle(.segmented)
            .padding(.horizontal)
            
            ZStack {
                VStack {
                    if isOngoing == 0 {
                        let _ = print("member schedule \(viewModel.scheduleMember.filter({$0.member.fullname == globalString.fullnamelogin && ($0.status_member == "Accepted" || $0.status_member == "Owner") && $0.schedule.status_schedule == "Success"} ).count)")
                        if(viewModel.scheduleMember.filter({$0.member.fullname == globalString.fullnamelogin && ($0.status_member == "Accepted" || $0.status_member == "Owner") && $0.schedule.status_schedule == "Success"} ).count != 0) {
                            VStack(spacing: 24){
                                ScrollView{
                                    ForEach(viewModel.scheduleMember.filter({$0.member.fullname == globalString.fullnamelogin && ($0.status_member == "Accepted" || $0.status_member == "Owner") && $0.schedule.status_schedule == "Success"} ), id:\.self) { item in //filter data before passing to for each
                                        EventCard(member: ScheduleMember(id: item.id, schedule: Schedule(id: item.schedule.id, created_at: item.schedule.created_at, user: User(email: item.schedule.user.email, fullname: item.schedule.user.fullname), nama: item.schedule.nama, latitude: item.schedule.latitude, longitude: item.schedule.longitude, alamat: item.schedule.alamat, namatempat: item.schedule.namatempat, tanggal: item.schedule.tanggal, waktu: item.schedule.waktu, status_schedule: item.schedule.status_schedule, note: item.schedule.note), member: User(email: item.member.fullname, fullname: item.member.fullname), created_at: item.created_at, status_member: item.status_member))
                                    }
                                }
                            }
                        } else {
                            NoEvent(isOngoing: isOngoing)
                        }
                    } else {
                        NavigationLink(destination: PendingInvitationView()) {
                            HStack {
                                Text("Pending Invitation")
                                    .font(.system(size: 16))
                                
                                Spacer()
                                
                                if (isPendingInvitation) {
                                    ZStack {
                                        Circle()
                                            .fill(.red)
                                            .frame(maxWidth: 20, maxHeight: 20)
                                        
                                        Text("\(viewModel.scheduleMember.filter({$0.member.fullname == globalString.fullnamelogin && $0.status_member == "Pending"} ).count)")
                                            .foregroundColor(.white)
                                            .font(.system(size: 13))
                                    }
                                }
                            }
                            .padding()
                            .frame(maxWidth: .infinity)
                            .foregroundColor(.black)
                            .cornerRadius(8)
                            .overlay(
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(Color("grayBg"), lineWidth: 1)
                            )
                            .padding(.horizontal)
                        }
                        .padding(.vertical, 10)
                        
                        if(!viewModel.scheduleMember.filter({$0.member.fullname == globalString.fullnamelogin && ($0.status_member == "Accepted" || $0.status_member == "Owner") && ($0.schedule.status_schedule == "Created" || $0.schedule.status_schedule == "Ongoing")} ).isEmpty) {
                            VStack(spacing: 24) {
                                ScrollView {
                                    ForEach(viewModel.scheduleMember.filter({$0.member.fullname == globalString.fullnamelogin && ($0.status_member == "Accepted" || $0.status_member == "Owner") && ($0.schedule.status_schedule == "Created" || $0.schedule.status_schedule == "Ongoing")} ), id:\.self) { item in //filter data before passing to for each
                                        EventCard(member: ScheduleMember(id: item.id, schedule: Schedule(id: item.schedule.id, created_at: item.schedule.created_at, user: User(email: item.schedule.user.email, fullname: item.schedule.user.fullname), nama: item.schedule.nama, latitude: item.schedule.latitude, longitude: item.schedule.longitude, alamat: item.schedule.alamat, namatempat: item.schedule.namatempat, tanggal: item.schedule.tanggal, waktu: item.schedule.waktu, status_schedule: item.schedule.status_schedule, note: item.schedule.note), member: User(email: item.member.fullname, fullname: item.member.fullname), created_at: item.created_at, status_member: item.status_member))
                                    }
//                                    EventCard(eventName: "Ini nama event yang panjanggggggggggggggggg", eventLocation: "The Breeze")
//                                    EventCard(eventName: "Ini nama eventnya", eventLocation: "The Breeze")
//                                    EventCard(eventName: "Ini nama eventnya", eventLocation: "The Breeze")
//                                    EventCard(eventName: "Ini nama eventnya", eventLocation: "The Breeze")
//                                    EventCard(eventName: "Ini nama eventnya", eventLocation: "The Breeze")
//                                    EventCard(eventName: "Ini nama eventnya", eventLocation: "The Breeze")
                                }
                            }
                        } else {
                            NoEvent(isOngoing: isOngoing)
                        }
                    }
                }
                
                Button(action: {
                    showModal.toggle()
                }) {
                    HStack {
                        Image(systemName: "plus.circle.fill")
                            .font(.system(size: 17))
                            .foregroundColor(.white)
                            .shadow(color: .gray, radius: 0.2, x: 1, y: 1)
                        
                        Text("New Event")
                            .font(.system(size: 17))
                            .foregroundColor(.white)
                    }
                    .padding()
                    .background(.blue)
                    .cornerRadius(1000)
                    .sheet(isPresented: $showModal) {
                        NavigationView {
                            NewEventModal()
                        }
                    }
                }
                .offset(x: universalSize.maxX * 0.28, y: universalSize.maxY * 0.32)
            }        .task{
                viewModel.loadSchedule()
            }
            
            Spacer()
        }
    }
}

struct EventView_Previews: PreviewProvider {
    static var previews: some View {
        EventView(isUserCurrentlyLoggedIn: .constant(false))
    }
}
