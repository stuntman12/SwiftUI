

import SwiftUI

struct RootView: View {
    
    @StateObject private var userSettings = UserSettings()
    @State private var storageManager = StorageManager.shared
    
    var body: some View {
        Group {
            if userSettings.isLoggedIn {
                ContentView()
            } else {
                LoginView()
            }
        }
        .onAppear {
            userSettings.isLoggedIn = storageManager.fetchBool()
            userSettings.name = storageManager.fetchString()
        }
        .environmentObject(userSettings)
    }
}

