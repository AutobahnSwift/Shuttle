import Foundation
import Moya
import Result

public extension MoyaProvider where Target: ShuttleTargetType {
    @discardableResult
    public func synchronousRequest<T: Decodable>(_ target: Target, returning: T.Type) throws -> T {
        do {
            let response = try synchronousRequest(target).map(returning, atKeyPath: target.decodeKeyPath)
            return response
        } catch MoyaError.jsonMapping(let response) {
            print("Failed to decode `\(String(describing: T.self))` at keyPath `\(target.decodeKeyPath ?? "")` from response: \n\(String(data: response.data, encoding: .utf8)!)")
            throw MoyaError.jsonMapping(response)
        }
    }

    @discardableResult
    public func synchronousRequest(_ target: Target) throws -> Moya.Response {
        let semaphore = DispatchSemaphore(value: 0)
        var response: Moya.Response? = nil
        var error: Error? = nil
        request(target, callbackQueue: .global(qos: .background)) { (result: Result) in
            defer { semaphore.signal() }
            switch result {
            case .success(let res):
                response = res
            case .failure(let err):
                error = err
            }
        }
        semaphore.wait()

        guard error == nil else {
            throw error!
        }
        return response!
    }
}
