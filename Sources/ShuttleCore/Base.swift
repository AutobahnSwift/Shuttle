

public protocol Base {
    associatedtype ClientType: Client

    static var _client: ClientType? { get set }
    static var client: ClientType! { get }
}

extension Base {
    static var client: ClientType! {
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
}
