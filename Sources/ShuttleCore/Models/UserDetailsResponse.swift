import Foundation

public struct UserDetailsData: Codable {
    let associatedAccounts: [AssociatedAccount]
    let contentProviderId: String
    let displayName: String
    let contentProvider: String
    let userName: String
}

public struct AssociatedAccount: Codable {
    let contentProvider: ITunesConnectContentProvider
}
