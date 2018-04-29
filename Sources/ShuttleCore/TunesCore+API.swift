import Foundation
import MoyaSugar
import Moya

public enum TunesCoreAPI {
    case userDetails
    case setTeamId(String, dsId: String)
}

extension TunesCoreAPI: SugarTargetType {
    public var baseURL: URL {
        return URL(string: "https://itunesconnect.apple.com/WebObjects/iTunesConnect.woa")!
    }

    public var route: Route {
        switch self {
        case .userDetails: return .get("/ra/user/details")
        case .setTeamId: return .post("/ra/v1/session/webSession")
        }
    }

    public var parameters: Parameters? {
        switch self {
        case let.setTeamId(id, dsId):
            return JSONEncoding() => [
                "contentProviderId": id,
                "dsId": dsId
            ]
        default:
            return nil
        }
    }

    public var headers: [String : String]? {
        return [
            "Content-Type": "application/json"
        ]
    }

    public var decodeKeyPath: String? {
        switch self {
        case .userDetails: return "data"
        default: return nil
        }
    }
}

