//
//  EventDetailView.swift
//  FridGet
//
//  Created by Haikal Lazuardi on 29/04/23.
//

import SwiftUI

struct EventDetailView: View {
    var eventStatus: String = "owner" // accepted, owner, pending
    var isHappening: Bool = false
    var isArrived: Bool = true
    var isOver: Bool = true
    
    @State var isShowDeleteEventAlert: Bool = false
    
    var body: some View {
        ScrollView {
            VStack {
                HStack {
                    VStack(alignment: .leading) {
                        Text("Ini Nama Eventnya")
                            .foregroundColor(.black)
                            .font(.system(size: 22))
                            .fontWeight(.semibold)
                        
                        Text("Thursday, 27 April 2023 16.00")
                            .foregroundColor(Color("gray"))
                            .font(.system(size: 12))
                    }
                    
                    Spacer()
                }
                .padding(.vertical)
                
                Group {
                    if (eventStatus == "pending") {
                        InvitationCard()
                    } else {
                        if (isHappening) {
                            if (isArrived) {
                                QualityTimeCard()
                            } else {
                                ArrivedConfirmationCard(action: {})
                            }
                        } else if (isOver) {
                            EventOverCard()
                            QualityTimeCard()
                            ArrivedConfirmationCard(action: {})
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
                        
                        Text("The Breeze BSD City")
                            .font(.system(size: 16))
                            .fontWeight(.semibold)
                    }
                    
                    Spacer()
                }
                
                HStack {
                    Image(systemName: "person.2.fill")
                        .font(.system(size: 12))
                    
                    Text("Guests — 4")
                        .font(.system(size: 12))
                    
                    Spacer()
                }
                .foregroundColor(Color("gray"))
                .padding(.top, 20)
                .padding(.bottom, 1)
                
                VStack(spacing: 12) {
                    Group {
                        UserCard(status: "organizer", isArrived: true)
                        UserCard(status: "accepted", isArrived: true)
                        UserCard(status: "pending")
                        UserCard(status: "rejected")
                    }
                    
                    Group {
                        UserCard(status: "accepted")
                        UserCard(status: "pending")
                        UserCard(status: "rejected")
                    }
                    
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
                    Text("Nanti jangan lupa bawa board game ya masing-masing.")
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
                
                if (eventStatus == "owner") {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button(action: {
                            isShowDeleteEventAlert = true
                        }) {
                            Text("Edit")
                                .foregroundColor(.blue)
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
                Text("Are you sure you want to delete ")
                + Text("Mini Challenge 1")
                    .bold()
                + Text(" event?")
            })
        }
    }
}

struct EventDetailView_Previews: PreviewProvider {
    static var previews: some View {
        EventDetailView()
    }
}
