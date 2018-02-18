import Foundation
import Moya
import MoyaSugar

public enum OlympusAPI {
    case itcServiceKey
    case session
}

extension OlympusAPI: ShuttleTargetType {
    public var baseURL: URL {
        return URL(string: "https://olympus.itunes.apple.com/v1")!
    }

    public var route: Route {
        switch self {
        case .itcServiceKey:
            return .get("/app/config")
        case .session:
            return .get("/session")
        }
    }

    public var parameters: Parameters? {
        switch self {
        case .itcServiceKey:
            return URLEncoding() => [
                "hostname": "itunesconnect.apple.com",
            ]
        default:
            return nil
        }
    }

    public var headers: [String : String]? {
        var headers = [String: String]()
        headers["Content-Type"] = "application/json"
        headers["X-Apple-Id-Session-Id"] = Client.sessionId
//        headers["X-Apple-Widget-Key"] = Client.itcServiceKey
        headers["Accept"] = "application/json"
        headers["Scnt"] = Client.scnt

        return headers
    }
}
