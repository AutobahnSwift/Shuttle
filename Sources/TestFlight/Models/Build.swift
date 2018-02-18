
public struct Build: Codable {
    enum BuildState: String, Codable {
        case processing = "testflight.build.state.processing"
        case active = "testflight.build.state.testing.active"
        case readyToSubmit = "testflight.build.state.submit.ready"
        case readyToTest = "testflight.build.state.testing.ready"
        case exportComplianceMissing = "testflight.build.state.export.compliance.missing"
    }

    let id: String
    let appId: String // appAdamId
    let providerId: String
    let bundleId: String
    let trainVersion: String
    let buildVersion: String
    let betaReviewInfo: String
    let exportCompliance: String
    let internalState: String
    let externalState: BuildState
    let testInfo: String
    let installCount: String
    let inviteCount: String
    let crashCount: String
    let didNotify: String
    let uploadDate: String

    var isProcessed: Bool {
        switch externalState {
        case .active, .readyToSubmit, .exportComplianceMissing:
            return true
        default:
            return false
        }
    }

    static func find(appId: String? = nil, buildId: String? = nil) -> [Build] {
        return [Build]()
    }

    static func all(appId: String? = nil, platform: String? = nil) -> [Build] {
        return [Build]()
    }

    static func buildsForTrain(appId: String? = nil, platform: String? = nil, version: String? = nil, retryCount: Int = 0) -> [Build] {
        return [Build]()
    }
    static func allProcessingBuilds(appId: String? = nil, platform: String? = nil) -> [Build] {
        return [Build]()
    }

//    static func latest(appId: String? = nil, platform: String? = nil) -> Build {
//        return Build()
//    }
}
