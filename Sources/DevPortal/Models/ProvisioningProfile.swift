import Foundation
import Core
import Moya
import MoyaSugar

enum ProvisioningProfileAPI {
    case getProvisioningProfiles(Platform, teamId: String)
}

extension ProvisioningProfileAPI: ShuttleTargetType {
    typealias ResultType = ProvisioningProfile

    var baseURL: URL {
        return DevPortalClient.hostname
    }

    var route: Route {
        switch self {
        case .getProvisioningProfiles(let platform, _):
            return .post("/account/\(platform.rawValue)/profile/listProvisioningProfiles.action")
        }
    }
    
    var parameters: Parameters? {
        return nil
    }

    var headers: [String : String]? {
        return nil
    }
}

struct ProvisioningProfile: Codable {

}
