import SwiftUI

struct ContentView: View {
    
    @AppStorage("darkModeEnabled") private var darkModeEnabled = false
    @AppStorage("systemThemeEnabled") private var systemThemeEnabled = false
    
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Image(systemName: "tray")
                    Text("Today")
                }
            SettingsView(darkModeEnabled: $darkModeEnabled, systemThemeEnabled: $systemThemeEnabled)
                .tabItem {
                    Image(systemName: "tray.full")
                    Text("Headlinr+")
                }
        }
        .onAppear {
            SystemThemeManager.shared.handleTheme(darkMode: darkModeEnabled, system: systemThemeEnabled)
        }
    }
}

struct TabView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
