import ShuttleCore

public struct DevPortal: Base {
    public static var _client: DevPortalClient?
    public static var client: DevPortalClient!

    // MARK: - Login

    public static func login(username: String, password: String) throws {
        client = DevPortalClient.login(email: username, password: password)
    }

    public static func selectTeam(id: String? = nil) throws {
        try client.selectTeam(id: id)
    }

    // MARK: - Apps

    public static var app: App.Type {
        let appType = App.self
        appType.client = client
        return appType
    }
}
