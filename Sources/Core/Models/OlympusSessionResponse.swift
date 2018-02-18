import Foundation

struct OlympusSessionResponse: Codable {
    let user: User
    let provider: OlympusContentProvider
    let availableProviders: [OlympusContentProvider]
    let backingType: String
    let roles: [Role]
    let unverifiedRoles: [Role]
//    let featureFlags: [String]
    let agreeToTerms: Bool
    let modules: [ITCModule]
    let helpLinks: [HelpLink]
}
