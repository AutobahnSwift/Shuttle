import Foundation
import Moya
import MoyaSugar

public enum AppleAuthAPI {
    case signIn(email: String, password: String, cookie: String?)
    case twoStepAuth
    case securityCode(String)
    case selectDevice(deviceId: String)
    case trust
}

extension AppleAuthAPI: ShuttleTargetType {
    public var baseURL: URL {
        return URL(string: "https://idmsa.apple.com/appleauth/auth")!
    }

    public var route: Route {
        switch self {
        case .signIn:
            return .post("/signin")
        case .twoStepAuth:
            return .get("")
        case .securityCode:
            return .post("/verify/trusteddevice/securitycode")
        case .selectDevice(let deviceId):
            return .put("/verify/device/\(deviceId)/securitycode")
        case .trust:
            return .get("/2sv/trust")
        }
    }

    public var parameters: Parameters? {
        switch self {
        case .signIn(let email, let password, _):
            return JSONEncoding() => [
                "accountName": email,
                "password": password,
                "rememberMe": true,
            ]
        case .securityCode(let code):
            return JSONEncoding() => [
                "securityCode": [
                    "code": code
                ]
            ]
        default:
            return nil
        }
    }

    public var headers: [String: String]? {
        var headers = [String: String]()
        headers["Content-Type"] = "application/json"
        headers["X-Apple-Id-Session-Id"] = Client.sessionId
        headers["X-Apple-Widget-Key"] = Client.itcServiceKey
        headers["Accept"] = "application/json"
        headers["Scnt"] = Client.scnt

        switch self {
        case .signIn(_, _, let cookie):
            headers["X-Requested-With"] = "XMLHttpRequest"
            if let c = cookie {
                headers["Cookie"] = c
            }
            return headers
        default:
            break
        }
        return headers
    }
}
