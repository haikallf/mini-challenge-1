//
//  EventCard.swift
//  FridGet
//
//  Created by Haikal Lazuardi on 29/04/23.
//

import SwiftUI

struct EventCard: View {
    var member: ScheduleMember
    //    var eventName: String
    //    var eventLocation: String
    //    var eventDate: String
    //    var eventTime: String
    var isPending: Bool = false
    //    @EnvironmentObject var itemData : ItemModelData
    
    var body: some View {
        NavigationLink(destination: EventDetailView(member: member)) {
            HStack(alignment: .top) {
                VStack(alignment: .leading) {
                    Text("\(member.schedule.tanggal), \(member.schedule.waktu)")
                        .foregroundColor(Color("gray"))
                        .font(.system(size: 12))
                    
                    Text(member.schedule.nama)
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
                        
                        Text(member.schedule.namatempat)
                            .font(.system(size: 13))
                            .padding(.leading, -2)
                    }
                    .foregroundColor(.black)
                }
                
                Spacer()
                
//                if (!isPending) {
//                    Image(systemName: "bell.fill")
//                        .resizable()
//                        .aspectRatio(contentMode: .fit)
//                        .frame(width: 17)
//                        .foregroundColor(.black)
//                } else {
//                    VStack {
//                        Spacer()
//                        
//                        HStack {
//                            Button(action: {}) {
//                                Image(systemName: "x.circle.fill")
//                                    .resizable()
//                                    .aspectRatio(contentMode: .fit)
//                                    .frame(width: 28)
//                                    .foregroundColor(Color("gray"))
//                            }
//                            
//                            Button(action: {}) {
//                                Image(systemName: "checkmark.circle.fill")
//                                    .resizable()
//                                    .aspectRatio(contentMode: .fit)
//                                    .frame(width: 28)
//                                    .foregroundColor(Color("gray"))
//                            }
//                        }
//                        
//                        Spacer()
//                    }
//                    
//                }
                
            }
            .padding()
            .frame(maxHeight: 100)
            .cornerRadius(8)
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color("grayBg"), lineWidth: 1)
            )
        }
        
    }
}

struct EventCard_Previews: PreviewProvider {
    static var previews: some View {
        EventCard(member: ScheduleMember(id: 0, schedule: Schedule(id: 0, created_at: "", user: User(email: "", fullname: ""), nama: "", latitude: "", longitude: "", alamat: "", namatempat: "", tanggal: "", waktu: "", status_schedule: "", note: ""), member: User(email: "", fullname: ""), created_at: "", status_member: ""))
    }
}
