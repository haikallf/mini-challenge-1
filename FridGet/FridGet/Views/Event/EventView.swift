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
    @Binding var isUserCurrentlyLoggedIn: Bool
    
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
                    }
                    else {
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
                        
                        if (isAvailableOngoing) {
                            VStack(spacing: 24) {
                                ScrollView {
                                    EventCard(eventName: "Ini nama event yang panjanggggggggggggggggg")
                                    EventCard(eventName: "Ini nama eventnya")
                                    EventCard(eventName: "Ini nama eventnya")
                                    EventCard(eventName: "Ini nama eventnya")
                                    EventCard(eventName: "Ini nama eventnya")
                                    EventCard(eventName: "Ini nama eventnya")
                                }
                            }
                        } else {
                            NoEvent(isOngoing: isOngoing)
                        }
                    }
                }
                
                Button(action: {}) {
                    VStack {
                        Spacer()
                        
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
                        .offset(x: universalSize.midX * 0.55)
                    }
                    
                }
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

                    Text("SJ")
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
