import SwiftUI

@main
struct SevenWindsStudioApp: App {
    @AppStorage("isEntered") var isEntered: Bool?

    var body: some Scene {
        WindowGroup {
            if isEntered ?? false {
                ContentView()
            } else {
                LoginView()
            }
        }
    }
}
