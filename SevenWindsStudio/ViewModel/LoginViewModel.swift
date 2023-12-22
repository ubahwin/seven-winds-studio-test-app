import Foundation
import SwiftUI

class LoginViewModel: ObservableObject {
    private let networkManager = NetworkManager()
    @AppStorage("isEntered") var isEntered: Bool = false

    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }

    func saveToken(token: String, lifetime: Int) {
        let currentDate = Date()
        let expirationDate = currentDate.addingTimeInterval(TimeInterval(lifetime))

        UserDefaults.standard.setValue(token, forKey: "token")
        UserDefaults.standard.set(expirationDate, forKey: "expirationDate")
    }

    func login(login: String, password: String) {
        networkManager.auth(login: login, password: password) { success, error in
            if let error = error {
                print(error)
                return
            }

            if let token = success?.token, let tokenLifetime = success?.tokenLifetime {
                self.saveToken(token: token, lifetime: tokenLifetime)

                DispatchQueue.main.async {
                    self.isEntered = true
                }
            }
        }
    }

    func register(login: String, password: String) {
        networkManager.register(login: login, password: password) { success, error in
            if let error = error {
                print(error)
                return
            }

            if let token = success?.token, let tokenLifetime = success?.tokenLifetime {
                self.saveToken(token: token, lifetime: tokenLifetime)

                DispatchQueue.main.async {
                    self.isEntered = true
                }
            }
        }
    }
}
