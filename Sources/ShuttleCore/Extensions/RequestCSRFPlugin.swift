import Moya
import Result
import Foundation

final class RequestCSRFPlugin: PluginType {

    var csrfToken: String?
    var csrfTimestamp: String?

    func prepare(_ request: URLRequest, target: TargetType) -> URLRequest {
        guard let csrf = csrfToken,
            let csrfTs = csrfTimestamp else {
                return request
        }
        var request = request
        request.addValue(csrf, forHTTPHeaderField: "csrf")
        request.addValue(csrfTs, forHTTPHeaderField: "csrf_ts")
        return request
    }

    func didReceive(_ result: Result<Moya.Response, MoyaError>, target: TargetType) {
        switch result {
        case .success(let response):
            csrfToken = response.response?.allHeaderFields["csrf"] as? String
            csrfTimestamp = response.response?.allHeaderFields["csrf_ts"] as? String
        default:
            return
        }
    }
}
