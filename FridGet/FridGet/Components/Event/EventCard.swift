//
//  EventCard.swift
//  FridGet
//
//  Created by Haikal Lazuardi on 29/04/23.
//

import SwiftUI

struct EventCard: View {
    var eventName: String
    var isPending: Bool = false
    var isOwner: Bool = false
    var isHappening: Bool = false
    
    @State var isShowRejectAlert: Bool = false
    
    var body: some View {
        NavigationLink(destination: EventDetailView()) {
            HStack {
                if (isPending) {
                    Rectangle()
                        .fill(Color("gray"))
                        .frame(maxWidth: 4)
                        .clipShape(Capsule())
                } else {
                    if (isOwner) {
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
                        if (isHappening) {
                            EventTag() 
                        } else {
                            Text("Thursday, 27 April 2023 16.00")
                                .foregroundColor(Color("gray"))
                                .font(.system(size: 12))
                        }
                        
                        
                        Text(eventName)
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
                            
                            Text("The Breeze")
                                .font(.system(size: 13))
                                .padding(.leading, -2)
                                .foregroundColor(.black)
                        }
                    }
                    
                    Spacer()
                    
                   if (isPending) {
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
        EventCard(eventName: "Event")
    }
}
