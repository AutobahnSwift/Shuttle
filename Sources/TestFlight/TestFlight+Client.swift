import ShuttleCore
import Moya

final class TestFlightClient: ShuttleCore.Client {

    let clientProvider = MoyaProvider<TestFlightAPI>()

//    var teams = [Team]()

//    required init(cookie: String? = nil, teamId: String? = nil) {
//        super.init()
//    }

//    static func login(email: String, password: String) -> TestFlightClient {
//        return TestFlightClient()
//    }

//    func sendLoginRequest(email: String, password: String) {
//
//    }
}
