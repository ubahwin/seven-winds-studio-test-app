import Foundation

struct LoginResponse: Codable {
    var token: String?
    var tokenLifetime: Int?

    enum CodingKeys: String, CodingKey {
        case token, tokenLifetime
    }
}
