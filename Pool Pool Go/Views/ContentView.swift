import SwiftUI

struct ContentView: View {
    @EnvironmentObject var modelData: ModelData
    @StateObject private var viewModel = LocationsViewModel()

    var body: some View {
        if modelData.activeProfile == nil {
            UserSelectionView()
                .environmentObject(modelData)
        } else {
            ZStack {
                TabView {
                    LocationsView()
                        .tabItem {
                            Label("Ubicaciones", systemImage: "map")
                        }
                        .environmentObject(viewModel)
                    
                    ProfileView()
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
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ModelData())
        
    }
}

