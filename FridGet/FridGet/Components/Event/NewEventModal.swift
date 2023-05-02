//
//  NewEventModal.swift
//  FridGet
//
//  Created by Haikal Lazuardi on 30/04/23.
//

import SwiftUI

struct NewEventModal: View {
    @Environment(\.dismiss) var dismiss
    
    @State var eventTitle: String = ""
    @State var eventDate: Date = Date()
    @State var eventTime: Date = Date()
    @State var eventLocation: String = ""
    @State var eventNotes: String = ""
    @State var isShowCancelAlert: Bool = false

    var body: some View {
        ZStack {
            Color("secondaryBg")
                .ignoresSafeArea()
            
            VStack {
                Divider()
                
                VStack {
                    VStack(alignment: .leading) {
                        TextField("Title", text: $eventTitle)
                            .multilineTextAlignment(.leading)
                    }
                    .padding([.leading, .vertical])
                    .background(.white)
                    .cornerRadius(8)
                    
                    VStack {
                        DatePicker("Date", selection: $eventDate, in: Date()..., displayedComponents: .date)
                            .foregroundColor(.black)
                        
                        Divider()
                        
                        DatePicker("Time", selection: $eventTime, in: eventDate..., displayedComponents: .hourAndMinute)
                            .foregroundColor(.black)
                    }
                    .padding([.horizontal, .vertical])
                    .background(.white)
                    .cornerRadius(8)
                    
                    VStack(alignment: .leading) {
                        TextField("Location", text: $eventLocation)
                            .multilineTextAlignment(.leading)
                    }
                    .padding([.leading, .vertical])
                    .background(.white)
                    .cornerRadius(8)
                    
                    VStack(alignment: .leading) {
                        TextField("Notes", text: $eventNotes)
                            .multilineTextAlignment(.leading)
                    }
                    .padding([.leading, .vertical])
                    .background(.white)
                    .cornerRadius(8)
                    
                }
                .alert("Are you sure you want to discard this new event?", isPresented: $isShowCancelAlert) {
                    Button("Discard Changes", role: .destructive, action: {
                        dismiss()
                    })
                    Button("Keep Editing", role: .cancel, action: {})
                }
                .padding()
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Text("Cancel")
                            .font(.system(size: 17))
                            .fontWeight(.regular)
                            .onTapGesture {
                                isShowCancelAlert = true
                            }
                    }
                    
                    ToolbarItem(placement: .principal) {
                        Text("New Event")
                            .font(.system(size: 17))
                            .fontWeight(.semibold)
                            .foregroundColor(.black)
                    }
                    
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Text("Create")
                            .font(.system(size: 17))
                            .fontWeight(.regular)
                            .onTapGesture {
                                dismiss()
                            }
                    }
                }
                
                Spacer()
            }
        }
    }
}

struct NewEventModal_Previews: PreviewProvider {
    static var previews: some View {
        NewEventModal()
    }
}
