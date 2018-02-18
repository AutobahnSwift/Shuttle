import Core
import Moya

final class DevPortalClient: Core.Client {
    let clientProvider = MoyaProvider<DevPortalAPI>()
    override lazy var teams: [Team] = try! clientProvider.synchronousRequest(.teams, returning: [Team].self)
    override var teamId: String {
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

//    override required init(cookie: String? = nil, teamId: String? = nil) {
//        super.init(cookie: cookie, teamId: teamId)
//    }

    public class func login(email: String, password: String) -> DevPortalClient {
        let client = DevPortalClient()
        client.sendLoginRequest(email: email, password: password)
        return client
    }

    override func sendLoginRequest(email: String, password: String) {
        sendSharedLoginRequest(email: email, password: password)
    }

    func apps(platform: Platform) throws -> [App] {
        return try clientProvider.synchronousRequest(.apps(platform, teamId: teamId), returning: [App].self)
    }

    func createApp(type: BundleIdType, name: String, bundleId: String, platform: Platform, enableServices: [AppService]) throws -> App {
        let params = CreateAppParams(type: type, name: name, teamId: teamId, bundleId: bundleId, enableServices: enableServices)
        return try clientProvider.synchronousRequest(.createApp(platform, params: params), returning: App.self)
    }

    func deleteApp(appId: String, platform: Platform) throws {

    }

    func updateAppName(appId: String, name: String, platform: Platform) throws -> App? {
        return nil
    }
}
