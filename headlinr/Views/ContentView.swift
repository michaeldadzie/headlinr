import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Image(systemName: "tray")
                    Text("Today")
                }
            SettingsView()
                .tabItem {
                    Image(systemName: "tray.full")
                    Text("Headlinr+")
                }
        }
    }
}

struct TabView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
