//
//  LocationsViewModel.swift
//  Pool Pool Go
//
//  Created by ramiro garza on 3/20/24.
//

import Foundation
import MapKit
import SwiftUI

class LocationsViewModel: ObservableObject {
    // All loaded locations
    @Published var locations: [Location]
    
    // Current location on the map
    @Published var mapLocation: Location {
        didSet {
            updateMapPosition(location: mapLocation)
        }
    }
    
    // Current camera region on map
    @Published var mapRegion = MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 25.6471, longitude: -100.3815),
            span: MKCoordinateSpan(latitudeDelta: 0.06, longitudeDelta: 0.06)
    )
    let mapSpan = MKCoordinateSpan(latitudeDelta: 0.06, longitudeDelta: 0.06)

    // For future proofing with camera position:
    //    @Published var mapCameraPosition = MapCameraPosition.region(MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 25.6471, longitude: -100.3815), span: MKCoordinateSpan(latitudeDelta: 0.06, longitudeDelta: 0.06)))
    //    let mapSpan = MKCoordinateSpan(latitudeDelta: 0.06, longitudeDelta: 0.06)
    
    // Show list of locations
    @Published var showLocationsList: Bool = false
    
    // Show location detail with sheet
    @Published var sheetLocation: Location? = nil
    
    init(){
        let locations = LocationsDataService.locations
        self.locations = locations
        self.mapLocation = locations.first!
         
        self.updateMapPosition(location: locations.first!)
    }
    
    private func updateMapPosition(location: Location) {
        withAnimation(.easeInOut) {
            mapRegion = MKCoordinateRegion(center: location.coordinates, span: mapSpan)
        }
    }
    
    func toggleLocationsList() {
        withAnimation(.easeInOut) {
            showLocationsList = !showLocationsList
        }
    }
    
    func showNextLocation(location:Location) {
        withAnimation(.easeInOut) {
            mapLocation = location
            showLocationsList = false
        }
    }
}
 
