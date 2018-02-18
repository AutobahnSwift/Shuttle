import Foundation

public enum Role: String, Codable {
    case admin = "ADMIN"
    case appManager = "APP_MANAGER"
    case customerSupport = "CUSTOMER_SUPPORT"
}

public struct User: Codable {
    let fullName: String
    let emailAddress: String
    let prsId: String
}
