import Foundation
import Moya
import MoyaSugar

extension SugarTargetType {
    public var sampleData: Data {
        return Data()
    }
}

public protocol ShuttleTargetType: SugarTargetType {
    associatedtype ResultType: Decodable
    var decodeKeyPath: String? { get }
}

public extension ShuttleTargetType {
    var decodeKeyPath: String? { return nil }
}
