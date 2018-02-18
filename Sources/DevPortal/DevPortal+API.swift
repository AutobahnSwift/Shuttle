import Foundation
import Core
import Moya
import MoyaSugar

public enum Platform: String, Codable {
    case mac
    case ios
}

enum DevPortalAPI {
    case teams
    case apps(Platform, teamId: String)
    case createApp(Platform, params: CreateAppParams)
}

extension DevPortalAPI: ShuttleTargetType {
    var baseURL: URL {
        return URL(string: "https://developer.apple.com/services-account/\(DevPortalClient.protocolVersion)/")!
    }

    var route: Route {
        switch self {
        case .teams:
            return .post("account/listTeams.action")
        case .apps(let platform, _):
            return .post("account/\(platform.rawValue)/identifiers/listAppIds.action")
        case .createApp(let platform, _):
            return .post("aacount/\(platform.rawValue)/identifiers/addAppId.action")
        }
    }

    var parameters: Parameters? {
        switch self {
        case .apps(_, let teamId):
            return URLEncoding() => [
                "teamId":       teamId,
                "pageNumber":   1,
                "pageSize":     40,
                "sort":         "name=asc",
            ]
        case .createApp(_, let params):
            var parameters = JSONEncoding() => [
                "type":             params.type.rawValue,
                "identifier":       params.bundleId,
                "name":             params.name,
                "teamId":           params.teamId,
                "push":             params.type == .wildcard ? nil : "on",
                "inAppPurchase":    params.type == .wildcard ? nil : "on",
                "gameCenter":       params.type == .wildcard ? nil : "on",
            ]
            params.enableServices.forEach { service in
                parameters.values[service.serviceId] = service.values
            }
            return parameters
        default:
            return nil
        }
    }

    var headers: [String : String]? {
        return nil
    }

    var decodeKeyPath: String? {
        switch self {
        case .teams: return "teams"
        case .apps:  return "appIds"
        default:
            return nil
        }
    }

    var validate: Bool { return true }
}

