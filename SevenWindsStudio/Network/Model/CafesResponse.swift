import Foundation

struct CafeResponse: Codable {
    let id: Int?
    let name: String?
    let point: PointResponse?
}

struct PointResponse: Codable {
    let latitude, longitude: String?
}

typealias CafesResponse = [CafeResponse]
