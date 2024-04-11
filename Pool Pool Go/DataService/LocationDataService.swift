//
//  LocationDataService.swift
//  Pool Pool Go
//
//  Created by ramiro garza on 3/20/24.
//

import Foundation
import MapKit

class LocationsDataService {
    
    static let locations: [Location] = [
        Location(
            id: 1,
            name: "Liverpool Valle Oriente",
            cityName: "San Pedro Garza García",
            coordinates: CLLocationCoordinate2D(latitude: 25.6389, longitude: -100.3142),
            imageName: "liverpool"
        ),
        Location(
            id: 2,
            name: "Liverpool Paseo La Fe",
            cityName: "San Nicolás de los Garza",
            coordinates: CLLocationCoordinate2D(latitude: 25.7201, longitude: -100.2182),
            imageName: "liverpool"        ),
        Location(
            id: 3,
            name: "Liverpool Galerías Monterrey",
            cityName: "Monterrey",
            coordinates: CLLocationCoordinate2D(latitude: 25.6818, longitude: -100.3537),
            imageName: "liverpool"
        ),
        Location(
            id: 4,
            name: "Liverpool Esfera",
            cityName: "Monterrey",
            coordinates: CLLocationCoordinate2D(latitude: 25.5751, longitude: -100.2432),
            imageName: "liverpool"
        ),
        Location(
            id: 5,
            name: "Palacio de Hierro San Agustín",
            cityName: "San Pedro Garza García",
            coordinates: CLLocationCoordinate2D(latitude: 25.6513, longitude: -100.3590),
            imageName: "palacio"
        ),
        Location(
            id: 6,
            name: "Kitchen Aid Punto Valle",
            cityName: "San Pedro Garza García",
            coordinates: CLLocationCoordinate2D(latitude: 25.6588, longitude: -100.3549),
            imageName: "kitchen-aid-pv"
        ),
        Location(
            id: 7,
            name: "Whirpool Padre Mier",
            cityName: "Monterrey",
            coordinates: CLLocationCoordinate2D(latitude: 25.6707, longitude: -100.3290),
            imageName: "default"
        ),
        Location(
            id: 8,
            name: "Kitch",
            cityName: "San Pedro Garza García",
            coordinates: CLLocationCoordinate2D(latitude: 25.6591, longitude: -100.3620),
            imageName: "default"
        ),
        Location(
            id: 9,
            name: "COOKWARE",
            cityName: "Monterrey",
            coordinates: CLLocationCoordinate2D(latitude: 25.6967, longitude: -100.3458),
            imageName: "default"
        ),
        Location(
            id: 10,
            name: "Cooking Depot",
            cityName: "San Pedro Garza García",
            coordinates: CLLocationCoordinate2D(latitude: 25.6526, longitude: -100.3784),
            imageName: "default"
        )
    ]
}
