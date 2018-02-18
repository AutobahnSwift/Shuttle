import Core
import Foundation

enum SomeError: Error {
    case todo
}

enum BundleIdType: String, Codable {
    case wildcard
    case explicit
}

public struct CreateAppParams: Codable {
    let type: BundleIdType
    let name: String
    let teamId: String
    let bundleId: String
    let enableServices: [AppService]

    public func encode(to encoder: Encoder) throws {
        
    }
}

public class App: Codable {
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
    public let enabledFeatures: [AppService]
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

    private static var _client: DevPortalClient?
    static var client: DevPortalClient! {
        get {
            guard let client = _client else {
                fatalError("Please login using `Spaceship.DevPortal.login(username: \"user\", \"password\")`")
            }
            return client
        }
        set {
            _client = newValue
        }
    }

    public static func all(platform: Platform = .ios) throws -> [App] {
        return try client.apps(platform: platform)
    }

    public static func find(bundleId: String, platform: Platform = .ios) throws -> App? {
        return nil
    }

    public static func create(bundleId: String, name: String, platform: Platform = .ios, enableServices: [AppService] = []) throws -> App {
        let type: BundleIdType = bundleId.hasSuffix("*") ? .wildcard : .explicit
        return try client.createApp(type: type, name: name, bundleId: bundleId, platform: platform, enableServices: enableServices)
    }

    // MARK: - Instance

    public func delete() throws -> App {
        try App.client.deleteApp(appId: appId, platform: platform)
        return self
    }

    public func updateName(name: String) throws -> App? {
        return try App.client.updateAppName(appId: appIdId, name: name, platform: platform)
    }
}

