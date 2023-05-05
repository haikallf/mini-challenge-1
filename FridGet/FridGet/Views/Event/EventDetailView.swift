//
//  EventDetailView.swift
//  FridGet
//
//  Created by Haikal Lazuardi on 29/04/23.
//

import SwiftUI

struct EventDetailView: View {
//    var eventStatus: String = "owner" // accepted, owner, pending
//    var isHappening: Bool = false
//    var isArrived: Bool = true
//    var isOver: Bool = true
    
    @State var isShowDeleteEventAlert: Bool = false
    @State var isShowEditEventModal: Bool = false
    
    @StateObject var viewModel = ViewModel()
    
    var member: ScheduleMember
    
    var body: some View {
        ScrollView {
            VStack {
                HStack {
                    VStack(alignment: .leading) {
                        Text("\(member.schedule.nama)")
                            .foregroundColor(.black)
                            .font(.system(size: 22))
                            .fontWeight(.semibold)
                        
                        Text("\(member.schedule.tanggal), \(member.schedule.waktu)")
                            .foregroundColor(Color("gray"))
                            .font(.system(size: 12))
                    }
                    
                    Spacer()
                }
                .padding(.vertical)
                
                Group {
                    if (member.status_member == "Pending") {
                        InvitationCard(member: member)
                    } else {
                        if (member.schedule.status_schedule == "Ongoing") {
                            if (member.status_member == "Arrived") {
                                QualityTimeCard(member: member)
                            } else {
                                ArrivedConfirmationCard(action: {}, member: member)
                            }
                        } else if (member.schedule.status_schedule == "Success") {
                            EventOverCard(member: member)
//                            QualityTimeCard()
//                            ArrivedConfirmationCard(action: {})
                        }
                    }
                }
                .padding(.bottom)
                
                HStack {
                    VStack(alignment: .leading) {
                        HStack {
                            Image(systemName: "mappin.circle.fill")
                                .font(.system(size: 12))
                            
                            Text("Location")
                                .font(.system(size: 12))
                        }
                        .foregroundColor(Color("gray"))
                        .padding(.bottom, 1)
                        
                        Text(member.schedule.namatempat)
                            .font(.system(size: 16))
                            .fontWeight(.semibold)
                        Spacer()
                        Text(member.schedule.alamat)
                            .font(.system(size: 12))
                            .foregroundColor(Color("gray"))
                    }
                    
                    Spacer()
                }
                
                HStack {
                    Image(systemName: "person.2.fill")
                        .font(.system(size: 12))
                    
                    Text("Guest - \(viewModel.scheduleMember.filter({$0.schedule.id == member.schedule.id}).count)")
                        .font(.system(size: 12))
                    
                    Spacer()
                }
                .foregroundColor(Color("gray"))
                .padding(.top, 20)
                .padding(.bottom, 1)
                
                VStack(spacing: 12) {
                    ForEach(viewModel.scheduleMember.filter({$0.schedule.id == member.schedule.id}), id:\.self) { item in
                        UserCard(member: ScheduleMember(id: item.id, schedule: Schedule(id: item.schedule.id, created_at: item.schedule.created_at, user: User(email: item.schedule.user.email, fullname: item.schedule.user.fullname), nama: item.schedule.nama, latitude: item.schedule.latitude, longitude: item.schedule.longitude, alamat: item.schedule.alamat, namatempat: item.schedule.namatempat, tanggal: item.schedule.tanggal, waktu: item.schedule.waktu, status_schedule: item.schedule.status_schedule, note: item.schedule.note), member: User(email: item.member.email, fullname: item.member.fullname), created_at: item.created_at, status_member: item.status_member))
                        
//                                UserCard(status: "accepted")
                    }
                }.task{
                    viewModel.loadSchedule()
                }
                
                HStack {
                    Image(systemName: "text.alignleft")
                        .font(.system(size: 12))
                    
                    Text("Notes")
                        .font(.system(size: 12))
                    
                    Spacer()
                }
                .foregroundColor(Color("gray"))
                .padding(.top, 20)
                .padding(.bottom, 1)
                
                HStack {
                    Text("\(member.schedule.note)")
                        .font(.system(size: 15))
                    
                    Spacer()
                }

                Spacer()
            }
            .padding()
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("Event Details")
                        .font(.system(size: 17))
                        .fontWeight(.semibold)
                }
                
                if (member.status_member == "Owner") {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Menu(content: {
                            Button(action: {
                                isShowEditEventModal.toggle()
                            }) {
                                Label("Edit Event", systemImage: "pencil")
                            }
                            
                            Button(role: .destructive, action: {
                                isShowDeleteEventAlert = true
                            }) {
                                Label("Delete Event", systemImage: "trash")
                            }
                            .foregroundColor(.red)
                         }, label: {
                             Image(systemName: "ellipsis.circle")
                                 .foregroundColor(.blue)
                         })
                        .sheet(isPresented: $isShowEditEventModal) {
                            NavigationView {
                                EditEventModal(eventTitle: member.schedule.nama, eventLocation: member.schedule.namatempat, eventStreet: member.schedule.alamat, eventNotes: member.schedule.note)
                            }
                        }
                    }
                }
            }
            .alert("Delete Invitation", isPresented: $isShowDeleteEventAlert, actions: {
                Button("Cancel", role: .cancel, action: {
                    isShowDeleteEventAlert = false
                })
                
                Button("Delete", role: .destructive, action: {})
                
            }, message: {
                Text("Are you sure you want to delete this event?")
            })
        }
    }
}

struct EventDetailView_Previews: PreviewProvider {
    static var previews: some View {
        EventDetailView(member: ScheduleMember(id: 0, schedule: Schedule(id: 0, created_at: "", user: User(email: "", fullname: ""), nama: "", latitude: "", longitude: "", alamat: "", namatempat: "", tanggal: "", waktu: "", status_schedule: "", note: ""), member: User(email: "", fullname: ""), created_at: "", status_member: ""))
    }
}
