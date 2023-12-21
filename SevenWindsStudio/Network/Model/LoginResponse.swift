import Foundation

struct LoginResponse: Codable {
    var token: String?
    var tokenLifetime: Int?
}
