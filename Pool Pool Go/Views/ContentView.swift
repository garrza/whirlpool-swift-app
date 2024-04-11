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
            .tint(.accentColor)
            .onAppear(perform: {
                UITabBar.appearance().unselectedItemTintColor = .systemGray
                UITabBarItem.appearance().badgeColor = .blue
                UITabBar.appearance().backgroundColor = .systemGray4.withAlphaComponent(0.4)
                UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.systemBlue]
            })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ModelData())
    }
}
