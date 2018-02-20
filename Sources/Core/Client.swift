import Foundation
import Alamofire
import Moya

//protocol BasicPreferredInfoError {
//    var preferredInfo: String { get }
//}

enum BasicPreferredInfoError: Swift.Error {
    case invalidUserCredentials
    case noUserCredentials
    case programLicenseAgreementUpdated
    case insufficientPermissions
    case unexpectedResponse
    case appleTimeoutError
    case unauthorizedAccessError
    case internalServerError

    // TODO: Implement
    var showGitHubIssues: Bool {
        return false
    }

    var preferredInfo: String? {
        switch self {
        case .insufficientPermissions:
            return "Insufficient permissions for your Apple ID: "
        case .unexpectedResponse:
            return "Apple provided the following error info: "
        default:
            return "The request could not be completed because: "
        }
    }
}

enum ITunesConnectError: Swift.Error {
    case generic(String)
    case temporaryError
    case potentialServerError
}


public protocol AuthenticatedClient {
    func sendLoginRequest(email: String, password: String)
}

private func JSONResponseDataFormatter(_ data: Data) -> Data {
    do {
        let dataAsJSON = try JSONSerialization.jsonObject(with: data)
        let prettyData =  try JSONSerialization.data(withJSONObject: dataAsJSON, options: .prettyPrinted)
        return prettyData
    } catch {
        return data // fallback to original data if it can't be serialized.
    }
}

open class Client {
    let plugins: [PluginType] = [
        NetworkLoggerPlugin(verbose: true, responseDataFormatter: JSONResponseDataFormatter),
        RequestCSRFPlugin()
    ]
    open lazy var provider = MoyaProvider<MultiTarget>(plugins: plugins)
    lazy var olympusProvider = MoyaProvider<OlympusAPI>()
    lazy var appleAuthProvider = MoyaProvider<AppleAuthAPI>()
    lazy var tunesCoreProvider = MoyaProvider<TunesCoreAPI>()

    open class var hostname: URL {
        fatalError("You must implement self.hostname")
    }
    public static let protocolVersion: String = "QH65B2"
    public static let userAgent: String = "Shuttle 1.0"
    static var sessionId: String? = nil
    static var scnt: String? = nil

    public var user: User? = nil
    public var userEmail: String? {
        return user?.emailAddress
    }
//    var csrfTokens: [String] { get set }

    open lazy var userDetails = try! tunesCoreProvider.requestSync(.userDetails).map(UserDetailsData.self)
    open lazy var teams: [Team] = userDetails.associatedAccounts.map { Team(name: $0.contentProvider.name, teamId: String($0.contentProvider.contentProviderId)) }

    public var currentTeamId: String? = nil
    open var teamId: String {
        get {
            if let currentId = currentTeamId {
                return currentId
            }
            if teams.count > 1 {
                print("The current user is in \(teams.count) teams. Pass a team ID or call `selectTeam` to choose a team. Using the first one for now.")
            }
            currentTeamId = teams[0].id
            return currentTeamId!
        }
        set {
            guard teams.contains(where: { $0.id == newValue }) else {
                fatalError("Could not set team ID to '\(newValue)', only found the following available teams:\n\n\(teams.map { "- \($0.id) (\($0.name)" }.joined(separator: "\n"))\n")
            }

            

            currentTeamId = newValue
        }
    }

    public func selectTeam(id: String? = nil) throws {
        if let id = id {
            print("Attempting to select team with id: `\(id)`")
            teamId = id
        } else if teams.count > 1 {
            print("Multiple teams found on the " + "Developer Portal".yellow + ", please enter the number of the team you want to use:")
            for (id, team) in teams.enumerated() {
                print("\(id + 1). \(team.name) (\(team.id))")
            }
            print("> ", terminator: "")
            if let indexString = readLine(), let index = Int(indexString) {
                print("Selecting team `\(teams[index].name)`...")
                teamId = teams[index].id
            } else {
                fatalError("Failed to get teamId")
            }
        } else {
            print("Only one team available")
        }
    }

//    static func clientWithAuth(from client: Client) -> Self

    public required init(cookie: String? = nil, teamId: String? = nil) {
        self.currentTeamId = teamId
    }

    // MARK: - Paging

    // The page size we want to request, defaults to 500
    public let pageSize: Int = 40

    // Handles the paging for you... for free
    // Just pass a block and use the parameter as page number
    public func paging<T>(_ block: (Int) -> [Result<T>]?) -> [Result<T>] {
        return []
    }

    // MARK: - Login and Team Selection

    public func sendSharedLoginRequest(email: String, password: String) {
        let response = try! appleAuthProvider.requestSync(.signIn(email: email, password: password, cookie: nil))
//        print("Auth Response: \(String(data: response.data, encoding: .utf8)!)")
        switch response.statusCode {
        case 403:
            print("Invalid username and password combination. Used '\(email)' as the username.")
        case 200:
            // We are good to go fetch session now
            fetchOlympusSession()
        case 409:
            // 2 factor is enabled for this account, first handle that
            // and then get the olympus session
            print("Two factor is enabled for this account and isn't supported yet")
            handleTwoStep(response: response)
            fetchOlympusSession()
        default:
            // Need to handle other cases still
            print("Invalid username and password combination. Used '\(email)' as the username.")
        }
    }

    func fetchOlympusSession() {
        _ = try! olympusProvider.requestSync(.session).map(OlympusSessionResponse.self)
        // TODO: Track providers
//        teams = sessionResponse.availableProviders
//        print(sessionResponse)
    }

    static var itcServiceKey = {
        return try! MoyaProvider<OlympusAPI>().requestSync(.itcServiceKey).map(AuthService.self).authServiceKey
    }()

    var cookie: String? = nil

    func storeCookie() {
        
    }

    var autobahnUserDir: URL {
        return URL(fileURLWithPath: "")
    }

    var persistentCookieURL: URL {
//        if ENV["SPACESHIP_COOKIE_PATH"]
//          path = File.expand_path(File.join(ENV["SPACESHIP_COOKIE_PATH"], "spaceship", self.user, "cookie"))
//        else
//          [File.join(self.fastlane_user_dir, "spaceship"), "~/.spaceship", "/var/tmp/spaceship", "#{Dir.tmpdir}/spaceship"].each do |dir|
//          dir_parts = File.split(dir)
//          if directory_accessible?(File.expand_path(dir_parts.first))
//            path = File.expand_path(File.join(dir, self.user, "cookie"))
//            break
//          end
//        end
        return URL(fileURLWithPath: "")
    }
}
