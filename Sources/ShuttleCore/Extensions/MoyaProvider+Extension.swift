import Foundation
import Moya
import Result

public extension MoyaProvider where Target == MultiTarget {
    @discardableResult
    public func requestSyncDecodedValue<T: ShuttleTargetType>(_ target: T) throws -> T.ResultType {
        do {
            let response = try requestSync(MultiTarget(target)).map(T.ResultType.self, atKeyPath: target.decodeKeyPath)
            return response
        } catch MoyaError.jsonMapping(let response) {
            print("Failed to decode `\(String(describing: T.ResultType.self))` at keyPath `\(target.decodeKeyPath ?? "")` from response: \n\(String(data: response.data, encoding: .utf8)!)")
            throw MoyaError.jsonMapping(response)
        }
    }

    @discardableResult
    public func requestSyncDecodedArray<T: ShuttleTargetType>(_ target: T) throws -> [T.ResultType] {
        do {
            let response = try requestSync(MultiTarget(target)).map([T.ResultType].self, atKeyPath: target.decodeKeyPath)
            return response
        } catch MoyaError.jsonMapping(let response) {
            print("Failed to decode `\(String(describing: T.ResultType.self))` at keyPath `\(target.decodeKeyPath ?? "")` from response: \n\(String(data: response.data, encoding: .utf8)!)")
            throw MoyaError.jsonMapping(response)
        }
    }

    @discardableResult
    public func requestSync<T: ShuttleTargetType>(_ target: T) throws -> Moya.Response {
        return try requestSync(MultiTarget(target))
    }
}

extension MoyaProvider {
    @discardableResult
    public func requestSync(_ target: Target) throws -> Moya.Response {
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
