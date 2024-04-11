//
//  Pool_Pool_GoApp.swift
//  Pool Pool Go
//
//  Created by ramiro garza on 3/20/24.
//

import SwiftUI

@main
struct Pool_Pool_GoApp: App {
    
    @StateObject private var vm = LocationsViewModel()
    
    var body: some Scene {
        WindowGroup {
            LocationsView()
                .environmentObject(vm)
        }
    }
}
