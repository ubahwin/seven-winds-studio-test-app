import Foundation

struct LocationResponse: Codable {
    let id: Int?
    let name: String?
    let point: PointResponse?
}

struct PointResponse: Codable {
    let latitude, longitude: Double?
}
