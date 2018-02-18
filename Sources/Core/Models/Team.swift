public enum ContentType: String, Codable {
    case software = "SOFTWARE"
}

public struct OlympusContentProvider: Codable {
    var providerId: Int
    var name: String
    var contentTypes: [ContentType]
}

public struct ITunesConnectContentProvider: Codable {
    let contentProviderId: Int
    let name: String
}

public struct Team: Codable {
    public let name: String
    let teamId: String
    public var id: String {
        return teamId
    }
}
