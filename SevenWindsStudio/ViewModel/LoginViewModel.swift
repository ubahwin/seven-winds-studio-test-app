import Foundation
import SwiftUI

class LoginViewModel: ObservableObject {
    private let networkManager: NetworkManager
    @AppStorage("isEntered") var isEntered: Bool = false
    @AppStorage("token") var token: String?

    init() {
        self.networkManager = NetworkManager()
    }

    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }

    func login(login: String, password: String) {
        networkManager.auth(login: login, password: password) { success, error in
            if let error = error {
                print(error)
                return
            }

            if let token = success?.token {
                UserDefaults.standard.set(token, forKey: "token")
                DispatchQueue.main.async {
                    self.token = token
                    self.isEntered = true
                }
            }
        }
    }
}
