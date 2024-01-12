import SwiftUI

struct SettingsView: View {
    @Binding var darkModeEnabled: Bool
    @Binding var systemThemeEnabled: Bool
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Display"), footer: Text("System settings will override Dark mode and use current device theme")) {
                    Toggle(isOn: $darkModeEnabled) {
                        Text("Dark Mode")
                    }
                    .onChange(of: darkModeEnabled, perform: { _ in
                        SystemThemeManager.shared.handleTheme(darkMode: darkModeEnabled, system: systemThemeEnabled)
                    })
                    
                    Toggle(isOn: $systemThemeEnabled) {
                        Text("System")
                    }
                    .onChange(of: systemThemeEnabled, perform: { _ in
                        SystemThemeManager.shared.handleTheme(darkMode: darkModeEnabled, system: systemThemeEnabled)
                    })
                }
                
//                Section {
//                    Link(destination: URL(string: Constants.twitter)!) {
//                        Label("@michaeldadzie", systemImage: "link.badge.plus")
//                            .foregroundColor(.primary)
//                            .font(.system(size: 16, weight: .semibold))
//                    }
//                }
            }
            .navigationTitle("Settings")
        }
    }
}

#Preview {
    SettingsView(darkModeEnabled: .constant(false), systemThemeEnabled: .constant(false))
}
