import Foundation

struct CoffeeResponse: Codable {
    let id: Int?
    let name, imageURL: String?
    let price: Int?
}

typealias CafeResponse = [CoffeeResponse]
