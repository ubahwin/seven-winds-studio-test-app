import Foundation
import MapKit
import SwiftUI

class CafesViewModel: ObservableObject {
    private let networkManager = NetworkManager()
    @Published var cafes: [Cafe] = []
    @Published var order: [Coffee] = []

    @AppStorage("isEntered") var isEntered: Bool?

    init() {
        self.loadCafes()
    }

    func loadCafes() {
        networkManager.loadCafes { success, error in
            if let error = error {
                print(error)
                return
            }

            if let cafes = success {
                var newCafes = [Cafe]()
                for cafe in cafes {
                    newCafes.append(cafe.mapToCafe)
                }

                DispatchQueue.main.async {
                    self.cafes = newCafes
                }
            }
        }
    }

    func loadCafe(id: Int) {
        networkManager.loadCafe(id: id) { success, error in
            if let error = error {
                print(error)
                return
            }

            if let order = success {
                var newOrder = [Coffee]()
                for coffee in order {
                    newOrder.append(coffee.mapToCoffee)
                }

                DispatchQueue.main.async {
                    self.order = newOrder
                }
            }
        }
    }
}
