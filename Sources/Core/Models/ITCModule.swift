import Foundation

struct ITCModule: Codable {
    let key: String
    let name: String
    let localizedName: String
    let url: URL
    let iconUrl: URL
    let down: Bool
    let hasNotifications: Bool
}
