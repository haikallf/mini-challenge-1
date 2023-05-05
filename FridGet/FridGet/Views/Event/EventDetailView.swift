//
//  EventDetailView.swift
//  FridGet
//
//  Created by Haikal Lazuardi on 29/04/23.
//

import SwiftUI

//class ViewModel2: ObservableObject {
//    @Published var schedule: [Schedule] = []
//
//    func loadSchedule() {
//        guard let url = URL(string: "http://127.0.0.1:8000/api/schedule/") else {
//            return
//        }
//
//        let task = URLSession.shared.dataTask(with: url) {[weak
//            self] data, _, error in
//            guard let data = data, error == nil else {
//                return
//            }
//
//            do {
//                let schedule = try JSONDecoder().decode([Schedule].self, from: data)
//                DispatchQueue.main.async {
//                    self?.schedule = schedule
//                }
//            }
//            catch {
//                print(error)
//            }
//        }
//
//
//        task.resume()
//    }
//}

struct EventDetailView: View {
    var eventStatus: String = "pending" // accepted, owner, pending
    var eventId: String = ""

//    @StateObject var viewModel = ViewModel2()
    @StateObject var viewModel = ViewModel()
    
    let member: ScheduleMember
    
    var body: some View {
        ScrollView {
            HStack {
                VStack(alignment: .leading) {
                    Text(member.schedule.nama)
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
            
     
            
            
            if (member.status_member == "Pending") {
                InvitationCard(member: member)
            }
            
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
                            let _ = print("member schedule \(viewModel.scheduleMember)")
                            let _ = print("member schedule1 \(member)")
                            ForEach(viewModel.scheduleMember.filter({$0.schedule.id == member.schedule.id}), id:\.self) { item in
                                UserCard(member: ScheduleMember(id: item.id, schedule: Schedule(id: item.schedule.id, created_at: item.schedule.created_at, user: User(email: item.schedule.user.email, fullname: item.schedule.user.fullname), nama: item.schedule.nama, latitude: item.schedule.latitude, longitude: item.schedule.longitude, alamat: item.schedule.alamat, namatempat: item.schedule.namatempat, tanggal: item.schedule.tanggal, waktu: item.schedule.waktu, status_schedule: item.schedule.status_schedule, note: item.schedule.note), member: User(email: item.member.email, fullname: item.member.fullname), created_at: item.created_at, status_member: item.status_member))
                                
//                                UserCard(status: "accepted")
                            }
            
                        }        .task{
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
//        }.onAppear {
//            viewModel.loadSchedule()
//
//        }
        .padding()
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text("Event Details")
                    .font(.system(size: 17))
                    .fontWeight(.semibold)
            }
            
            if (eventStatus == "owner") {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {}) {
                        Text("Edit")
                            .foregroundColor(.blue)
                    }
                }
            }
            
        }
    }
}

struct EventDetailView_Previews: PreviewProvider {
//    static let itemData1 = ItemModelData()
    static var previews: some View {
        EventDetailView(member: ScheduleMember(id: 0, schedule: Schedule(id: 0, created_at: "", user: User(email: "", fullname: ""), nama: "", latitude: "", longitude: "", alamat: "", namatempat: "", tanggal: "", waktu: "", status_schedule: "", note: ""), member: User(email: "", fullname: ""), created_at: "", status_member: ""))
    }
}
