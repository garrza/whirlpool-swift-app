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
    @StateObject private var modelData = ModelData()
    @State private var showAppStart = true

    var body: some Scene {
        WindowGroup {
            ZStack {
                if showAppStart {
                    AppStartView(isActive: $showAppStart)
                } else {
                    ContentView()
                        .environmentObject(vm)
                        .environmentObject(modelData)
                }
            }
        }
    }
}

struct AppStartView: View {
    @Binding var isActive: Bool

    var body: some View {
        Image("launcher")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .ignoresSafeArea()
                .padding()
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                    isActive = false
                }
            }
    }
}
