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
    
    var body: some View {
        NavigationLink(destination: EventDetailView()) {
            HStack(alignment: .top) {
                VStack(alignment: .leading) {
                    Text("Thursday, 27 April 2023 16.00")
                        .foregroundColor(Color("gray"))
                        .font(.system(size: 12))
                    
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
                        
                        Text("The Breeze")
                            .font(.system(size: 13))
                            .padding(.leading, -2)
                    }
                    .foregroundColor(.black)
                }
                
                Spacer()
                
                if (!isPending) {
                    Image(systemName: "bell.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 17)
                        .foregroundColor(.black)
                } else {
                    VStack {
                        Spacer()
                        
                        HStack {
                            Button(action: {}) {
                                Image(systemName: "x.circle.fill")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 28)
                                    .foregroundColor(Color("gray"))
                            }
                            
                            Button(action: {}) {
                                Image(systemName: "checkmark.circle.fill")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 28)
                                    .foregroundColor(Color("gray"))
                            }
                        }
                        
                        Spacer()
                    }
                    
                }
                
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
        EventCard(eventName: "Event")
    }
}
