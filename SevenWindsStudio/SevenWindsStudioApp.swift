import SwiftUI

@main
struct SevenWindsStudioApp: App {
    @AppStorage("isEntered") var isEntered: Bool?

    init() {
        if !isTokenValid {
            isEntered = false
        }
    }

    var body: some Scene {
        WindowGroup {
            if isEntered ?? false {
                ContentView()
            } else {
                LoginView()
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
