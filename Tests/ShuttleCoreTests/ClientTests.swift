@testable import ShuttleCore
import XCTest

class TestClient: ShuttleCore.Client {

}

class RetryTests: XCTestCase {
    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }

    func testReRaisesWhenRetryLimitReachedThrowingTimeoutError() {

    }

    func testReRaisesWhenRetryLimitReachedThrowingConnectionFailed() {

    }

    func testRetriesWhenTimeoutErrorThrown() {

    }

    func testRetriesWhenConnectionFailedErrorThrown() {

    }

    func testRaisesAppleTimeoutErrorWhenResponseContains302Found() {

    }

    func testSuccessfullyRetriesRequestAfterLoggingInAgainWhenUnauthorizedAccessErrorThrown() {

    }

    func testFailsToRetryRequestIfLoginFailsInRetryBlockWhenUnauthorizedAccessErrorThrown() {

    }

    func testRetryWhenUserAndPasswordNotFetchedFromCredentialManagerIsAbleToRetryAndLoginSuccessfully() {

    }
}

class PersistentCookieTests: XCTestCase {
    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }

    func testUsesEnvWhenSet() {

    }

    func testUsesHomeDirByDefault() {

    }

    func testUsesTmpDirIfHomeNotAvailable() {

    }

    func testFallsBackToTmpDirAsLastResort() {

    }
}
