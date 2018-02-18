import Core

public struct DevPortal {
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
