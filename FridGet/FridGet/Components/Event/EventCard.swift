//
//  EventCard.swift
//  FridGet
//
//  Created by Haikal Lazuardi on 29/04/23.
//

import SwiftUI

struct EventCard: View {
//    var eventName: String
    var isPending: Bool = false
//    var isOwner: Bool = false
//    var isHappening: Bool = false
    
    @State var isShowRejectAlert: Bool = false
    var member: ScheduleMember
    
    var body: some View {
        NavigationLink(destination: EventDetailView(member: member)) {
            HStack {
                if (member.status_member == "Pending") {
                    Rectangle()
                        .fill(Color("gray"))
                        .frame(maxWidth: 4)
                        .clipShape(Capsule())
                } else {
                    if (member.status_member == "Owner") {
                        Rectangle()
                            .fill(Color("indigo"))
                            .frame(maxWidth: 4)
                            .clipShape(Capsule())
                    } else {
                        Rectangle()
                            .fill(Color("teal"))
                            .frame(maxWidth: 4)
                            .clipShape(Capsule())
                    }
                }
                
                HStack(alignment: .top) {
                    VStack(alignment: .leading) {
                        if (member.schedule.status_schedule == "Ongoing") {
                            EventTag(member : member) 
                        } else {
                            Text("\(member.schedule.tanggal), \(member.schedule.waktu)")
                                .foregroundColor(Color("gray"))
                                .font(.system(size: 12))
                        }
                        
                        
                        Text("\(member.schedule.nama)")
                            .foregroundColor(.black)
                            .font(.system(size: 16))
                            .fontWeight(.semibold)
                            .padding(.top, 2)
                            .padding(.bottom, 1)
                        
                        HStack {
                            Image(systemName: "mappin.circle.fill")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 16)
                                .foregroundColor(.blue)
                            
                            Text("\(member.schedule.namatempat)")
                                .font(.system(size: 13))
                                .padding(.leading, -2)
                                .foregroundColor(.black)
                        }
                    }
                    
                    Spacer()
                    
                    if (member.status_member == "Pending") {
                        VStack {
                            Spacer()
                            
                            HStack {
                                Button(action: {
                                    isShowRejectAlert = true
                                }) {
                                    Image(systemName: "xmark.circle.fill")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 28)
                                        .foregroundColor(Color("lightRed"))
                                }
                                
                                Button(action: {}) {
                                    Image(systemName: "checkmark.circle.fill")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 28)
                                        .foregroundColor(Color("lightGreen"))
                                }
                            }
                            
                            Spacer()
                        }
                    }
                }
            }
            .frame(maxHeight: 80)
            .alert("Reject Invitation", isPresented: $isShowRejectAlert, actions: {
                Button("Cancel", role: .cancel, action: {
                    isShowRejectAlert = false
                })
                
                Button("Reject", role: .destructive, action: {})
                
            }, message: {
                Text("Are you sure you want to reject this event invitation?")
            })
        }
    }
}

struct EventCard_Previews: PreviewProvider {
    static var previews: some View {
        EventCard(member: ScheduleMember(id: 0, schedule: Schedule(id: 0, created_at: "", user: User(email: "", fullname: ""), nama: "", latitude: "", longitude: "", alamat: "", namatempat: "", tanggal: "", waktu: "", status_schedule: "", note: ""), member: User(email: "", fullname: ""), created_at: "", status_member: ""))
    }
}
