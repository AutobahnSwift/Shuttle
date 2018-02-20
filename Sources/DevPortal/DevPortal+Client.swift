import Foundation
import Core
import Moya

public final class DevPortalClient: Core.Client {
    public override class var hostname: URL {
        return URL(string: "https://developer.apple.com/services-account/\(protocolVersion)/")!
    }
    public static let headers: [String: String] = [
        "Accept": "application/json",
        "Content-Type": "application/x-www-form-urlencoded",
        "User-Agent": userAgent,
    ]
    public override lazy var teams: [Team] = try! provider.requestSync(MultiTarget(DevPortalAPI.teams)).map([Team].self, atKeyPath: "teams")
    public override var teamId: String {
        get {
            if let currentId = currentTeamId {
                return currentId
            }
            if teams.count > 1 {
                print("The current user is in \(teams.count) teams. Pass a team ID or call `selectTeam` to choose a team. Using the first one for now.")
            }

            if teams.count == 0 {
                // TODO: Keep track of email
                let email = "Unknown"
                fatalError("User '\(email)' does not have access to any teams with an active membership")
            }
            currentTeamId = teams[0].id
            return currentTeamId!
        }
        set {
            guard teams.contains(where: { $0.id == newValue }) else {
                fatalError("That teamId doesn't exist for the authenticated account")
            }
            currentTeamId = newValue
        }
    }

    public class func login(email: String, password: String) -> DevPortalClient {
        let client = DevPortalClient()
        client.sendSharedLoginRequest(email: email, password: password)
        return client
    }
}
