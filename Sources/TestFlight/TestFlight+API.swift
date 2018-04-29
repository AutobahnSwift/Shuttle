import ShuttleCore
import Foundation
import MoyaSugar

enum TestFlightAPI {

}

extension TestFlightAPI: SugarTargetType {
    var route: Route {
        fatalError("Not implemented")
    }

    var baseURL: URL {
        fatalError("Not implemented")
    }

    var parameters: Parameters? {
        return nil
    }

    var headers: [String : String]? {
        return nil
    }
}
