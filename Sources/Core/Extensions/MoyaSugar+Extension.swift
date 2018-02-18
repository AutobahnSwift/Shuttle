import Foundation
import Moya
import MoyaSugar

public extension SugarTargetType {
    var sampleData: Data {
        return Data()
    }
}

public protocol ShuttleTargetType: SugarTargetType {
    var decodeKeyPath: String? { get }
}

public extension ShuttleTargetType {
    var decodeKeyPath: String? { return nil }
}
