import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = LocationsViewModel()

    var body: some View {
        ZStack {
            TabView {
                LocationsView()
                    .tabItem {
                        Label("Ubicaciones", systemImage: "map")
                    }
                    .environmentObject(viewModel)

                ProfileView(profile: Profile.default)
                    .tabItem {
                        Label("Perfil", systemImage: "person.circle")
                    }
            }
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.white)
                    .shadow(radius: 3)
            )
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ModelData())
    }
}
