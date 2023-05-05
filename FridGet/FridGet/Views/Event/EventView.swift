//
//  EventView.swift
//  FridGet
//
//  Created by Haikal Lazuardi on 29/04/23.
//

import SwiftUI

//class ViewModel: ObservableObject {
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
//        task.resume()
//    }
//}


struct EventView: View {
    @State private var isOngoing: Int = 1
    @State private var isPendingInvitation: Bool = true
    @State private var isAvailableHistory: Bool = true
    @State private var isAvailableOngoing: Bool = true
    @State var universalSize = UIScreen.main.bounds
    @State private var showModal = false
    
    @State var fullnamelogin: String = "Gaizka Valencia"


    @Binding var isUserCurrentlyLoggedIn: Bool
//    @StateObject var viewModel = ViewModel2()
    @StateObject var viewModel = ViewModel()
    
    var body: some View {
        
        
        VStack(spacing: 16) {
            Picker("", selection: $isOngoing){
                Text("History").tag(0)
                Text("Ongoing").tag(1)
            }
            .pickerStyle(.segmented)
            
            ZStack {
                VStack {
                    if isOngoing == 0 {
                        if (viewModel.scheduleMember.filter({$0.member.fullname == fullnamelogin && $0.status_member == "Accepted" && $0.schedule.status_schedule == "Success"} ).count != 0) {
                            VStack(spacing: 24){
                                ScrollView{
                                    ForEach(viewModel.scheduleMember.filter({$0.member.fullname == fullnamelogin && $0.status_member == "Accepted" && $0.schedule.status_schedule == "Success"} ), id:\.self) { item in //filter data before passing to for each
                                        EventCard(member: ScheduleMember(id: item.id, schedule: Schedule(id: item.schedule.id, created_at: item.schedule.created_at, user: User(email: item.schedule.user.email, fullname: item.schedule.user.fullname), nama: item.schedule.nama, latitude: item.schedule.latitude, longitude: item.schedule.longitude, alamat: item.schedule.alamat, namatempat: item.schedule.namatempat, tanggal: item.schedule.tanggal, waktu: item.schedule.waktu, status_schedule: item.schedule.status_schedule, note: item.schedule.note), member: User(email: item.member.fullname, fullname: item.member.fullname), created_at: item.created_at, status_member: item.status_member))
                                    }
                                }
                            }
                        } else {
                            NoEvent(isOngoing: isOngoing)
                        }
                    } else {
                        if (isPendingInvitation) {
                            NavigationLink(destination: PendingInvitationView()) {
                                HStack {
                                    Image(systemName: "calendar")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 20)
                                    
                                    Text("Pending Invitation")
                                        .font(.system(size: 16))
                                    
                                    Spacer()
                                }
                                .padding()
                                .frame(maxWidth: .infinity)
                                .foregroundColor(.black)
                                .cornerRadius(8)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 8)
                                        .stroke(Color("grayBg"), lineWidth: 1)
                                )
                            }
                        }
                        
                        if (viewModel.scheduleMember.filter({$0.member.fullname == fullnamelogin && $0.status_member == "Accepted" && ($0.schedule.status_schedule == "Created" || $0.schedule.status_schedule == "Ongoing")} ).count != 0) {
                            VStack(spacing: 24) {
                                ScrollView {
                                    ForEach(viewModel.scheduleMember.filter({$0.member.fullname == fullnamelogin && $0.status_member == "Accepted" && ($0.schedule.status_schedule == "Created" || $0.schedule.status_schedule == "Ongoing")} ), id:\.self) { item in //filter data before passing to for each
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
        .padding([.horizontal, .top])
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItemGroup(placement: .principal) {
                HStack {
                    Text("Events")
                        .font(.system(size: 34))
                        .fontWeight(.bold)

                    Spacer()

                    Text(fullnamelogin.components(separatedBy: " ").map { String($0.prefix(1))}.joined().prefix(2))
                        .padding(.all, 10)
                        .background(.gray)
                        .foregroundColor(.white)
                        .cornerRadius(.infinity)
                }
            }
        }
    }
}

struct EventView_Previews: PreviewProvider {
    static var previews: some View {
        EventView(isUserCurrentlyLoggedIn: .constant(false))
    }
}
