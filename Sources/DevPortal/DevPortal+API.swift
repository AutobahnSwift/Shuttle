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
}

extension DevPortalAPI: SugarTargetType {
    var baseURL: URL {
        return DevPortalClient.hostname
    }

    var route: Route {
        switch self {
        case .teams:
            return .post("account/listTeams.action")
        }
    }

    var parameters: Parameters? {
        return nil
    }

    var headers: [String : String]? {
        return nil
    }

    var decodeKeyPath: String? {
        switch self {
        case .teams: return "teams"
        }
    }

    var validate: Bool { return true }
}

