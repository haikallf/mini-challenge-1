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

    @Binding var isUserCurrentlyLoggedIn: Bool
    
    var body: some View {
        HStack {
            Text("Events")
                .font(.system(size: 34))
                .fontWeight(.bold)

            Spacer()
            
            NavigationLink(destination: ProfileView()) {
                InitialAvatar(initial: "HA", fontSize: 20)
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
                        if (isAvailableHistory) {
                            ScrollView {
                                EventCard(eventName: "Ini nama event yang panjanggggggggggggggggg")
                                EventCard(eventName: "Ini nama eventnya")
                                EventCard(eventName: "Ini nama eventnya")
                                EventCard(eventName: "Ini nama eventnya")
                                EventCard(eventName: "Ini nama eventnya")
                                EventCard(eventName: "Ini nama eventnya")
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
                                        
                                        Text("1")
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
                        
                        
                        if (isAvailableOngoing) {
                            ScrollView {
                                VStack(spacing: 12) {
                                    // ForEach(arr.enumerated()) { idx, elmt in
                                    ForEach(1..<10) { idx in
                                        Group {
                                            EventCard(eventName: "Mini Challenge 1")
                                            
                                            if (idx != 9) { // last idx or arr.count == 1
                                                Divider()
                                                    .frame(height: 1)
                                                    .padding(.leading, 12)
                                            }
                                        }
                                        .padding(.horizontal)
                                    }
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
