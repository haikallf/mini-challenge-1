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
    @Binding var isUserCurrentlyLoggedIn: Bool
    
    var body: some View {
        VStack(spacing: 16) {
            Picker("", selection: $isOngoing){
                Text("History").tag(0)
                Text("Ongoing").tag(1)
            }
            .pickerStyle(.segmented)
            
            if isOngoing == 0 {
                if (isAvailableHistory) {
                    // Event Card
                } else {
                    NoEvent(isOngoing: isOngoing)
                }
            }
            else {
                if (isPendingInvitation) {
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
                    .cornerRadius(8)
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color("grayBg"), lineWidth: 1)
                    )
                }
                
                if (isAvailableOngoing) {
                    VStack(spacing: 24) {
                        EventCard(eventName: "Ini nama event yang panjanggggggggggggggggg")
                        EventCard(eventName: "Ini nama eventnya", isPending: true)
                    }
                } else {
                    NoEvent(isOngoing: isOngoing)
                }
            }
            
            Spacer()
        }
        .padding()
    }
}

struct EventView_Previews: PreviewProvider {
    static var previews: some View {
        EventView(isUserCurrentlyLoggedIn: .constant(false))
    }
}
