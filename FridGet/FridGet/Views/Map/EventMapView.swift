//
//  EventMap.swift
//  FridGet
//
//  Created by Haikal Lazuardi on 03/05/23.
//

import SwiftUI
import CoreLocation

struct EventMapView: View {
    @StateObject var mapData = MapViewModel()
    @State var locationManager = CLLocationManager()
    @State var tempLocation: Place? = nil
    
    @Binding var selectedLocation: Place?
    
    // for edit event modal only, new event modal always use selectedLocation
    var eventCoordinate: CLLocationCoordinate2D? = nil
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
        
    func getCurrentPlacemark() {
        guard let coordinate = eventCoordinate != nil ? eventCoordinate : selectedLocation?.place.location?.coordinate else { return }
        let location = CLLocation(latitude: coordinate.latitude, longitude: coordinate.longitude)
        let geocoder = CLGeocoder()
        geocoder.reverseGeocodeLocation(location) { placemarks, error in
            guard let placemark = placemarks?.first else {
                print("Tidak dapat menemukan lokasi")
                return
            }
            mapData.selectPlace(place: Place(place: placemark))
        }
    }
    
    var body: some View {
        ZStack {
            MapView()
                .environmentObject(mapData)
                .ignoresSafeArea(.all, edges: .all)
            
            VStack {
                VStack {
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                        
                        TextField("Search", text: $mapData.searchText)
                            .multilineTextAlignment(.leading)
                    }
                    .padding(.vertical, 10)
                    .padding(.horizontal)
                    .background(.white)
                    .cornerRadius(8)
                
                    // displays result autocomplete
                    if (!mapData.places.isEmpty && mapData.searchText != "") {
                        ScrollView {
                            VStack(spacing: 15) {
                                ForEach(mapData.places) { place in
                                    Text(place.place.name ?? "")
                                        .multilineTextAlignment(.leading)
                                        .padding(.leading)
                                        .foregroundColor(.black)
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        .onTapGesture {
                                            mapData.selectPlace(place: place)
                                            tempLocation = place
                                        }

                                    Divider()
                                }
                            }
                        }
                        .padding(.top)
                        .background(.white)
                        .cornerRadius(8)
                    }
                }
                .padding()
                
                Spacer()
                
                ZStack {
                    HStack {
                        Spacer()
                        
                        CustomButton(text: "Select Location", action: {
                            if (tempLocation != nil) {
                                selectedLocation = tempLocation
                                presentationMode.wrappedValue.dismiss()
                            }
                        }, isPrimary: false, width: 160)
                            .frame(alignment: .center)
                        Spacer()
                    }
                    
                    HStack {
                        Spacer()
                        
                        VStack {
                            Button(action: mapData.focusLocation, label: {
                                Image(systemName: "location.fill")
                                    .font(.title2)
                                    .padding(10)
                                    .background(.blue)
                                    .foregroundColor(.white)
                                    .clipShape(Circle())
                            })
                            
                            Button(action: mapData.updateMapType, label: {
                                Image(systemName: mapData.mapType == .standard ? "network" : "map")
                                    .font(.title2)
                                    .padding(10)
                                    .background(.blue)
                                    .foregroundColor(.white)
                                    .clipShape(Circle())
                                    .frame(alignment: .trailing)
                            })
                        }
                    }
                }
                .frame(maxWidth: .infinity)
                .padding()
            }
        }
        .onAppear(perform: {
            locationManager.delegate = mapData
            locationManager.requestWhenInUseAuthorization()
            
            getCurrentPlacemark()
           
        })
        .alert(isPresented: $mapData.permissionDenied, content: {
            Alert(title: Text("Permission Denied"), message: Text("Please enable permission in app settings"), dismissButton: .default(Text("Go to settings"), action: {
                UIApplication.shared.open(URL(string: UIApplication.openSettingsURLString)!)
            }))
        })
        .onChange(of: mapData.searchText, perform: { value in
            // Searching Places
            let delay = 0.3
            
            DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
                if (value == mapData.searchText) {
                    // search
                    self.mapData.searchQuery()
                }
            }
        })
    }
}

//struct EventMapView_Previews: PreviewProvider {
//    static var previews: some View {
//        EventMapView(locationName: .constant("Halo"), coordinate: .constant(CLLocationCoordinate2D(latitude: 0, longitude: 0)))
//    }
//}
