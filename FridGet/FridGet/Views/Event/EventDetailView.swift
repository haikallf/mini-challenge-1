//
//  EventDetailView.swift
//  FridGet
//
//  Created by Haikal Lazuardi on 29/04/23.
//

import SwiftUI

struct EventDetailView: View {
    var eventStatus: String = "accepted" // accepted, owner, pending
    var isHappening: Bool = true
    var isArrived: Bool = true
    
    var body: some View {
        ScrollView {
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
                            ZStack {
                                RoundedRectangle(cornerRadius: 8)
                                    .fill(.white)
                                    .shadow(color: Color.black.opacity(0.08), radius: 6)
                                
                                VStack(alignment: .leading, spacing: 8) {
                                    HStack {
                                        Image(systemName: "dot.radiowaves.left.and.right")
                                        Text("Happening Now")
                                        
                                    }
                                    .font(.system(size: 11))
                                    .padding(5)
                                    .foregroundColor(.white)
                                    .background(.red)
                                    .cornerRadius(1000)
                                    
                                    Text("Quality time mode")
                                        .multilineTextAlignment(.leading)
                                        .font(.system(size: 20))
                                        .fontWeight(.semibold)
                                    
                                    Text("This is your chance to bond your friendship, have fun!")
                                        .font(.system(size: 13))
                                        
                                }
                                .padding(.vertical)
                            }
                            .padding(.horizontal, 10)
                            
                        } else {
                            ZStack {
                                RoundedRectangle(cornerRadius: 8)
                                    .fill(.white)
                                    .shadow(color: Color.black.opacity(0.08), radius: 6)
                                
                                VStack(alignment: .leading, spacing: 8) {
                                    HStack {
                                        Image(systemName: "dot.radiowaves.left.and.right")
                                        Text("Happening Now")
                                            
                                    }
                                    .font(.system(size: 11))
                                    .padding(5)
                                    .foregroundColor(.white)
                                    .background(.red)
                                    .cornerRadius(1000)
                                    
                                    Text("Have you arrived at the event location?")
                                        .multilineTextAlignment(.leading)
                                        .font(.system(size: 20))
                                        .fontWeight(.semibold)
                                    
                                    Button(action: {}) {
                                        Text("I'm here")
                                            .padding()
                                            .frame(maxWidth: .infinity)
                                            .background(Color("lightBlue"))
                                            .fontWeight(.semibold)
                                            .cornerRadius(1000)
                                    }
                                    .padding(.top, 16)
                                }
                                .padding()
                                
                            }
                            .padding(.horizontal, 10)
                        }
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
    static var previews: some View {
        EventDetailView()
    }
}
