import Foundation
import Moya

struct TwoStepAuthResponse: Codable {
    let trustedDevices: [String]
}

struct TwoFactorAuthResponse: Codable {
    let trustedPhoneNumbers: [TwoFactorPhoneNumber]
    let trustedPhoneNumber: TwoFactorPhoneNumber
    let securityCode: SecurityCode
}
struct TwoFactorPhoneNumber: Codable {
    let id: Int
    let obfuscatedNumber: String
}

struct SecurityCode: Codable {
    let length: Int
    let tooManyCodesSent: Bool
    let tooManyCodesValidated: Bool
    let securityCodeLocked: Bool
}

extension Client {
    func handleTwoStep(response: Response) {
        guard let appleIdSessionId = response.response?.allHeaderFields["X-Apple-ID-Session-Id"] as? String,
            let scnt = response.response?.allHeaderFields["scnt"] as? String else {
                fatalError("Failed to required two step headers")
        }
        Client.sessionId = appleIdSessionId
        Client.scnt = scnt

        let res = try! appleAuthProvider.requestSync(.twoStepAuth)

//        guard res.statusCode == 200 else {
//            fatalError("Failed to get two factor code info: \(res.response)")
//        }

        if let _ = try? res.map(TwoStepAuthResponse.self) {
            // TODO: Handle two step
        } else if let twoFactorResponse = try? res.map(TwoFactorAuthResponse.self) {
            handleTwoFactor(response: twoFactorResponse)
        } else {
            fatalError("Invalid 2 step response: \(res)")
        }
    }

    func handleTwoFactor(response: TwoFactorAuthResponse) {
        let twoFactorUrl = ""
        print("Two Factor Authentication for account '\(userEmail ?? "???")' is enabled")

        let cookiePersisted = false
        let shuttleSessionEnv = ""
        if !cookiePersisted && shuttleSessionEnv.isEmpty {
            print("If you're running this in a non-interactive session (e.g. server or CI)")
            print("check out \(twoFactorUrl)")
        } else {
            // If the cookie is set but still required, the cookie is expired
            print("Your session cookie has been expired.")
        }

        let codeLength = response.securityCode.length
        print("Please enter the \(codeLength) digit code: ")
        guard let code = readLine() else {
            fatalError("Failed to get code from user")
        }
        print("Requesting session...")

        // Send securityCode back to server to get a valid session
        do {
            _ = try appleAuthProvider.requestSync(.securityCode(code))

            // we use `TunesClient.handleITCResponse`
            // since this might be from the Dev Portal, but for 2 step
//            TunesClient.handleITCResponse(r.body)

            storeSession()
        } catch let error {
            fatalError("Failed to get session: \(error.localizedDescription)")
        }

    }

    // Only needed for 2 step
    func loadSessionFromFile() -> String? {
        return ""
    }

    func loadSessionFromEnv() -> String? {
        return ""
    }

    // Fetch the session cookie from the environment
    // (if exists)
    static var shuttleSessionEnv: String? {
        return ""
    }

    func selectDevice(id: String) throws {
        
    }

    func storeSession() {
        // If the request was successful, r.body is actually nil
        // The previous request will fail if the user isn't on a team
        // on iTunes Connect, but it still works, so we're good

        // Tell iTC that we are trustworthy (obviously)
        // This will update our local cookies to something new
        // They probably have a longer time to live than the other poor cookies
        // Changed Keys
        // - myacinfo
        // - DES5c148586dfd451e55afb0175f62418f91
        // We actually only care about the DES value

        _ = try? appleAuthProvider.requestSync(.trust)

        // This request will fail if the user isn't added to a team on iTC
        // However we don't really care, this request will still return the
        // correct DES... cookie

        storeCookie()
    }
}
