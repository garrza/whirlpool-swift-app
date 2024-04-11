//
//  MapView.swift
//  Pool Pool Go
//
//  Created by ramiro garza on 3/20/24.
//

import SwiftUI
import MapKit

struct LocationsView: View {
    
    @EnvironmentObject private var vm: LocationsViewModel
    
    var body: some View {
        ZStack {
            mapLayer
                .ignoresSafeArea()
            
            VStack(spacing: 0) {
                header
                      .padding()
                Spacer()
                locationPrviewStack
            }
        }
        .sheet(item: $vm.sheetLocation, onDismiss: nil) { location in
            IncidentReportingView(location: location)
        }
    }
}

#Preview {
    LocationsView()
        .environmentObject(LocationsViewModel())
}

extension LocationsView {
    private var header: some View {
        VStack {
            Button(action: vm.toggleLocationsList) {
                HStack {
                        Image(systemName: "arrow.down")
                        .font(.headline)
                            .foregroundColor(.yellow)
                            .padding()
                            .rotationEffect(Angle(degrees: vm.showLocationsList ? 180 : 0))
                        Text(vm.mapLocation.name + ", " +  vm.mapLocation.cityName)
                            .font(.headline)
                            .fontWeight(.black)
                            .foregroundColor(.white)
                            .frame(height: 80)
                            .frame(maxWidth: .infinity)
                            .padding(.horizontal)
                    }
                .background(Color.accentColor)
                .animation(.none, value: vm.mapLocation)
            }
            
            if vm.showLocationsList{
                LocationsListView()
            }
        }
        .background(.thickMaterial)
        .cornerRadius(10)
        .shadow(color: Color.black.opacity(0.3), radius: 20, x: 0, y: 15)
    }
    
    private var mapLayer: some View {
        Map(coordinateRegion: $vm.mapRegion,
            annotationItems: vm.locations,
            annotationContent: { location in
            MapAnnotation(coordinate: location.coordinates) {
                Image("whirpool-pin")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 40, height: 40)
            }
        })
    }
    
    private var locationPrviewStack: some View {
        ZStack {
            ForEach(vm.locations) { location in
                if vm.mapLocation == location {
                    LocationPreviewView(location: location)
                        .shadow(color: Color.black.opacity(0.3), radius: 20)
                        .padding()
                }
            }
        }
    }
}
