//
//  EditEventModal.swift
//  FridGet
//
//  Created by Haikal Lazuardi Fadil on 03/05/23.
//

import SwiftUI
import CoreLocation

struct EditEventModal: View {
    @Environment(\.dismiss) var dismiss
    
    @State var eventTitle: String = "Mini Challenge 1"
    @State var eventDate: Date = Date()
    @State var eventTime: Date = Date()
    @State var selectedLocation: Place? = nil
    let eventLocation: String = "The Breeze"
    let eventStreet: String = "BSD Green Office Park"
    let eventCoordinate: CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: -6.305968, longitude: 106.672272)
    @State var eventGuests: [String] = ["haikalfadil@email.com", "satria@email.com"]
    @State var eventNotes: String = "Jangan lupa bawa laptop"
    
    @State var isShowCancelAlert: Bool = false
    @State var isShowAddGuestModal: Bool = false
    @State var isShowLocationModal: Bool = false
    
    @State var isTimePickerDisabled: Bool = true
    
//    func getCurrentPlacemark(completion: @escaping (CLPlacemark?) -> Void) {
//        let location = CLLocation(latitude: eventCoordinate.latitude, longitude: eventCoordinate.longitude)
//        let geocoder = CLGeocoder()
//        geocoder.reverseGeocodeLocation(location) { placemarks, error in
//            guard let placemark = placemarks?.first else {
//                print("Tidak dapat menemukan lokasi")
//                completion(nil)
//                return
//            }
//            completion(placemark)
//        }
//    }
//
//    init() {
//        self._selectedLocation = State(initialValue: Place(getCurrentPlacemark() { placemark in
//            return placemark
//        }) ?? "No Location")
//
//    }
    
//    init() {
//        self._eventLocation = State(initialValue: selectedLocation?.place.name ?? "No Location")
//        self._eventCoordinate = State(initialValue: CLLocationCoordinate2D(latitude: selectedLocation?.place.location?.coordinate.latitude ?? 0, longitude: selectedLocation?.place.location?.coordinate.longitude ?? 0))
//    }
       
    func isFormValid() -> Bool {
        return (eventTitle != "" && eventTime > Date() + (5 * 60 * 24) && eventLocation != "" && !eventGuests.isEmpty && eventNotes != "")
    }

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
                            .onTapGesture {
                                isTimePickerDisabled = false
                            }
                        
                        Divider()
                        
                        DatePicker("Time", selection: $eventTime, in: eventDate..., displayedComponents: .hourAndMinute)
                            .foregroundColor(.black)
                            .disabled(isTimePickerDisabled)
                    }
                    .padding([.horizontal, .vertical])
                    .background(.white)
                    .cornerRadius(8)
                    
                    VStack(alignment: .leading) {
                        NavigationLink(destination: EventMapView(selectedLocation: $selectedLocation, eventCoordinate: eventCoordinate)) {
                            HStack {
                                VStack(alignment: .leading) {
                                    Text(selectedLocation != nil ? selectedLocation?.place.name ?? "Unknown Location" : (eventLocation != "" ? eventLocation : "Location"))
                                        .foregroundColor(.black)
                                    
                                    Text(selectedLocation != nil ? selectedLocation?.place.thoroughfare ?? "Unnamed Road" : (eventStreet != "" ? eventStreet : "Event Street"))
                                        .font(.caption2)
                                        .foregroundColor(Color("tertiaryGray"))
                                }
    
                                Spacer()
                                
                                if (eventLocation != "") {
                                    Image(systemName: "xmark.circle.fill")
                                        .foregroundColor(Color("gray"))
                                        .onTapGesture {
                                            selectedLocation = nil
                                        }
                                }
                            }
                        }
                    }
                    .padding()
                    .background(.white)
                    .cornerRadius(8)
                    
                    VStack(alignment: .leading) {
                        HStack {
                            Text("Guests")
                                .foregroundColor(.black)
                            
                            Spacer()
                            HStack {
                                Text(eventGuests.isEmpty ? "None" : "\(eventGuests.count)")
                                Image(systemName: "chevron.right")
                            }
                            .foregroundColor(Color("secondaryGray"))
                            .onTapGesture {
                                isShowAddGuestModal.toggle()
                            }
                            .sheet(isPresented: $isShowAddGuestModal) {
                                NavigationView {
                                    AddGuestModal(eventGuests: $eventGuests)
                                }
                            }
                        }
                    }
                    .padding()
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
                .alert("Are you sure you want to discard this changes?", isPresented: $isShowCancelAlert) {
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
                            .foregroundColor(.blue)
                            .onTapGesture {
                                isShowCancelAlert = true
                            }
                    }
                    
                    ToolbarItem(placement: .principal) {
                        Text("Edit Event")
                            .font(.system(size: 17))
                            .fontWeight(.semibold)
                            .foregroundColor(.black)
                    }
                    
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Text("Done")
                            .font(.system(size: 17))
                            .fontWeight(.regular)
                            .foregroundColor(isFormValid() ? .blue : Color("gray"))
                            .onTapGesture {
                                print(eventDate)
                                dismiss()
                            }
                            .disabled(!isFormValid())
                    }
                }
                
                Spacer()
            }
        }
        .interactiveDismissDisabled(true)
    }
}

struct EditEventModal_Previews: PreviewProvider {
    static var previews: some View {
        EditEventModal()
    }
}
