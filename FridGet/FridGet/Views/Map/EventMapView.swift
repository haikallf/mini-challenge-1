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
    @State var selectedLocation: Place? = nil
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @Binding var locationName: String
    @Binding var coordinate: CLLocationCoordinate2D
    
    
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
                                            selectedLocation = mapData.selectPlace(place: place)
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
                            if (selectedLocation != nil) {
                                locationName = selectedLocation?.place.name ?? "Unnamed Road"
                                coordinate = selectedLocation?.place.location?.coordinate ?? CLLocationCoordinate2D(latitude: 0, longitude: 0)
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

struct EventMapView_Previews: PreviewProvider {
    static var previews: some View {
        EventMapView(locationName: .constant("Halo"), coordinate: .constant(CLLocationCoordinate2D(latitude: 0, longitude: 0)))
    }
}
