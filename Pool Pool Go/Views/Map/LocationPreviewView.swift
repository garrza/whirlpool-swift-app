//
//  LocationPreviewView.swift
//  Pool Pool Go
//
//  Created by ramiro garza on 3/21/24.
//

import SwiftUI

struct LocationPreviewView: View {
    @EnvironmentObject private var vm: LocationsViewModel
    let location: Location
     
    var body: some View {
        HStack(alignment: .bottom, spacing: 0)
        {
            VStack(alignment: .leading, spacing: 16.0) {
                imageSection
                titleSection
            }
            
            VStack() {
                captureButton
            }
        }
        .padding(20)
        .background(
        RoundedRectangle(cornerRadius: 10)
            .fill(.ultraThinMaterial)
            .offset(y: 50)
        )
        .cornerRadius(10)
    }
}

#Preview {
    ZStack {
        Color.blue.ignoresSafeArea()
        LocationPreviewView(location: LocationsDataService.locations.first!)
            .padding()
    }
}

extension LocationPreviewView {
    private var imageSection: some View {
        ZStack {
            Image(location.imageName)
                .resizable()
                .scaledToFill()
                .frame(width: 100, height: 100)
                .cornerRadius(10)
        }
        .padding(6)
        .background(Color.white)
        .cornerRadius(10)
    }
    
    private var titleSection: some View {
        VStack(alignment: .leading, spacing: 4){
            Text(location.name)
                .font(.title2)
                .fontWeight(.bold)
            Text(location.cityName)
                .font(.subheadline)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    private var captureButton: some View {
        Button() {
            vm.sheetLocation = location
        } label: {
            VStack {
                Text("📸")
                    .font(.title)
                Text("Capturar y reportar anomalía")
                    .font(.headline)
            }
        }
        .buttonStyle(.borderedProminent)
    }
}
