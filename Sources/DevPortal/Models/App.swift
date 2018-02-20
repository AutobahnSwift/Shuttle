import Core
import Foundation
import MoyaSugar
import Moya

enum BundleIdType: String, Codable {
    case wildcard
    case explicit
}

public struct CreateAppParams: Codable {
    let type: BundleIdType
    let name: String
    let bundleId: String
    let enableServices: [AppService]
}

enum AppAPI {
    case getAll(Platform, teamId: String)
    case create(Platform, teamId: String, params: CreateAppParams)
    case delete(Platform, teamId: String, appId: String)
    case update(Platform, teamId: String, name: String, appId: String)
}

extension AppAPI: ShuttleTargetType {
    typealias ResultType = App

    var baseURL: URL {
        return DevPortalClient.hostname
    }

    var route: Route {
        switch self {
        case .getAll(let platform, _):
            return .post("account/\(platform.rawValue)/identifiers/listAppIds.action")
        case .create(let platform, _, _):
            return .post("aacount/\(platform.rawValue)/identifiers/addAppId.action")
        case .delete(let platform, _, _):
            return .post("account/\(platform.rawValue)/identifiers/deleteAppId.action")
        case .update(let platform,_, _, _):
            return .post("account/\(platform.rawValue)/identifiers/updateAppIdName.action")
        }
    }

    var parameters: Parameters? {
        switch self {
        case let .getAll(_, teamId):
            return URLEncoding() => [
                "teamId":       teamId,
                "pageNumber":   1,
                "pageSize":     40,
                "sort":         "name=asc",
            ]
        case let .create(_, teamId, params):
            var parameters = URLEncoding() => [
                "teamId":           teamId,
                "type":             params.type.rawValue,
                "identifier":       params.bundleId,
                "name":             params.name,
                "push":             params.type == .wildcard ? nil : "on",
                "inAppPurchase":    params.type == .wildcard ? nil : "on",
                "gameCenter":       params.type == .wildcard ? nil : "on",
            ]
            params.enableServices.forEach { service in
                parameters.values[service.serviceId] = service.values
            }
            return parameters
        case let .delete(_, teamId, appId):
            return URLEncoding() => [
                "teamId": teamId,
                "appIdId": appId,
            ]
        case let .update(_, teamId, name, appId):
            return URLEncoding() => [
                "teamId": teamId,
                "appIdId": appId,
                "name": name
            ]
        }
    }

    var headers: [String : String]? {
        let headers = DevPortalClient.headers
//        headers["csrf"] = ""
//        headers["csrf_ts"] = ""
        return headers
    }

    var decodeKeyPath: String? {
        switch self {
        case .getAll:  return "appIds"
        case .create: return "appId"
        case .update: return "appId"
        default: return nil
        }
    }
}

public class App: Base, Codable {
    let appIdId: String
    public var appId: String { return appIdId }
    public let name: String
    let appIdPlatform: String
    public var platform: Platform { return Platform(rawValue: appIdPlatform)! }
    public let prefix: String
    let identifier: String
    public var bundleId: String { return identifier }
    public let isWildCard: Bool
//    public let features: [Feature]
    public let enabledFeatures: [String]
    public let isDevPushEnabled: Bool?
    public let isProdPushEnabled: Bool?
    let associatedApplicationGroupsCount: Int?
    public var appGroupsCount: Int { return associatedApplicationGroupsCount ?? 0}
    let associatedCloudContainersCount: Int?
    public var CloudContainersCount: Int { return associatedCloudContainersCount ?? 0 }
    let associatedIdentifiersCount: Int?
    public var identifiersCount: Int { return associatedIdentifiersCount ?? 0 }
    let associatedApplicationGroups: [AppGroup]?
    public var associatedGroups: [AppGroup] { return associatedApplicationGroups ?? [] }


    // MARK: - Static

    public static var _client: DevPortalClient?
    public static var client: DevPortalClient!

    public static func all(platform: Platform = .ios) throws -> [App] {
        return try client.provider.requestSyncDecodedArray(AppAPI.getAll(platform, teamId: client.teamId))
    }

    public static func find(bundleId: String, platform: Platform = .ios) throws -> App? {
        return nil
    }

    public static func create(bundleId: String, name: String, platform: Platform = .ios, enableServices: [AppService] = []) throws -> App {
        let type: BundleIdType = bundleId.hasSuffix("*") ? .wildcard : .explicit
        let params = CreateAppParams(type: type, name: name, bundleId: bundleId, enableServices: enableServices)
        return try client.provider.requestSyncDecodedValue(AppAPI.create(platform, teamId: client.teamId, params: params))
    }

    // MARK: - Instance

    public func delete() throws -> App {
        try App.client.provider.requestSync(AppAPI.delete(platform, teamId: App.client.teamId, appId: appId))
        return self
    }

    public func update(name: String) throws -> App? {
        return try App.client.provider.requestSyncDecodedValue(AppAPI.update(platform, teamId: App.client.teamId, name: name, appId: appId))
    }
}

