//
//  Place.swift
//  FridGet
//
//  Created by Haikal Lazuardi on 04/05/23.
//

import SwiftUI
import MapKit

struct Place: Identifiable {
    var id = UUID().uuidString
    var place: CLPlacemark
    
}
