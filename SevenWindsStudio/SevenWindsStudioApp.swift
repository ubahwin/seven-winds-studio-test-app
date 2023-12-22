import SwiftUI

@main
struct SevenWindsStudioApp: App {
    @AppStorage("isEntered") var isEntered: Bool?
    @Environment(\.colorScheme) var colorScheme

    init() {
        if !isTokenValid {
            isEntered = false
        }
    }

    var body: some Scene {
        WindowGroup {
            if isEntered ?? false {
                ContentView()
                    .preferredColorScheme(.light)
            } else {
                LoginView()
                    .preferredColorScheme(.light)
            }
        }
    }

    var isTokenValid: Bool {
        if
            let expirationDate = UserDefaults.standard.value(forKey: "expirationDate") as? Date,
            expirationDate < Date()
        {
            return false
        }
        return true
    }
}
