import SwiftUI

struct Coffee: Identifiable {
    var id: Int
    var name: String
    var amount: Int
    var image: URL?

    var count: Int = 0
}

extension CoffeeResponse {
    var mapToCoffee: Coffee {
        return Coffee(
            id: self.id ?? 0,
            name: self.name ?? "",
            amount: self.price ?? 0,
            image: URL(string: self.imageURL ?? "")
        )
    }
}
