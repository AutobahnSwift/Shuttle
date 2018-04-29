@testable import ShuttleCore
import TestSupport
import XCTest

class DecodableTests: XCTestCase {
    let decoder = JSONDecoder()

    func testDecodeOlympusSession200() throws {
        let data = Mock.olympusSession200.data(using: .utf8)!
        _ = try decoder.decode(OlympusSessionResponse.self, from: data)
    }

    func testDecodeTwoFactorCodeInfo200() throws {
        let data = Mock.twoFactorCodeInfo200.data(using: .utf8)!
        _ = try decoder.decode(TwoFactorAuthResponse.self, from: data)
    }
}
