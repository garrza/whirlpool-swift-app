//
//  Location.swift
//  Pool Pool Go
//
//  Created by ramiro garza on 3/20/24.
//

import Foundation
import SwiftUI
import MapKit

struct Location: Identifiable, Equatable {
    var id: Int
    var name: String
    var cityName: String
    var coordinates: CLLocationCoordinate2D
    var imageName: String
    
    static func == (lhs: Location, rhs: Location) -> Bool {
        lhs.id == rhs.id
    }
}
