import Foundation

public enum SevenWindsStudioApi {
    case auth(login: String, password: String)
    case getLocations
}

extension SevenWindsStudioApi: EndpointType {
    var baseURL: URL {
        guard let url = URL(string: "http://147.78.66.203:3210/") else { fatalError("baseURL could not be configured.")}
        return url
    }

    var path: String {
        switch self {
        case .getLocations: return "locations"
        case .auth: return "auth/login"
        }
    }

    var httpMethod: HTTPMethod {
        switch self {
        case .auth: return .post

        default: return .get
        }
    }

    var headers: HTTPHeaders? {
        switch self {
        default: return ["User-Agent": "PostmanRuntime/7.36.0"]
        }
    }

    var body: Parameters? {
        switch self {
        case .auth(let login, let password): return [
            "login": login,
            "password": password
        ]
        default: return nil
        }
    }

    var task: HTTPTask {
         return .requestParametersAndHeaders(
            bodyParameters: body,
            urlParameters: urlParameters,
            additionHeaders: headers
        )
    }
}

extension SevenWindsStudioApi {
    var urlParameters: Parameters? {
        switch self {
        default: return [:]
        }
    }
}
