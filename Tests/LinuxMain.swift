// Generated using Sourcery 0.8.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

import XCTest

@testable import ShuttleTests

extension BuildStateTests {
  static var allTests: [(String, (BuildStateTests) -> () throws -> Void)] = [
    ("testReady", testReady)
  ]
}

extension BuildTests {
  static var allTests: [(String, (BuildTests) -> () throws -> Void)] = [
    ("testGetBuildByID", testGetBuildByID),
    ("testThrowWhenBuildNotFound", testThrowWhenBuildNotFound),
    ("testGetBuildsAcrossAllTrains", testGetBuildsAcrossAllTrains),
    ("testGetProcessingBuilds", testGetProcessingBuilds)
  ]
}

extension DecodableTests {
  static var allTests: [(String, (DecodableTests) -> () throws -> Void)] = [
    ("testDecodeOlympusSession200", testDecodeOlympusSession200)
  ]
}

extension LauncherTests {
  static var allTests: [(String, (LauncherTests) -> () throws -> Void)] = [
    ("testHasAClient", testHasAClient),
    ("testReturnsAScopedModelClass", testReturnsAScopedModelClass),
    ("testPassesTheClientToTheModels", testPassesTheClientToTheModels)
  ]
}

extension PersistentCookieTests {
  static var allTests: [(String, (PersistentCookieTests) -> () throws -> Void)] = [
    ("testUsesEnvWhenSet", testUsesEnvWhenSet),
    ("testUsesHomeDirByDefault", testUsesHomeDirByDefault),
    ("testUsesTmpDirIfHomeNotAvailable", testUsesTmpDirIfHomeNotAvailable),
    ("testFallsBackToTmpDirAsLastResort", testFallsBackToTmpDirAsLastResort)
  ]
}

extension PortalTests {
  static var allTests: [(String, (PortalTests) -> () throws -> Void)] = [
    ("testExample", testExample)
  ]
}

extension ProvisioningProfileTests {
  static var allTests: [(String, (ProvisioningProfileTests) -> () throws -> Void)] = [
    ("testAllProperlyRetrievesAndFiltersTheProvisioningProfiles", testAllProperlyRetrievesAndFiltersTheProvisioningProfiles),
    ("testShouldFilterByTheCorrectTypes", testShouldFilterByTheCorrectTypes),
    ("testAppStoreAndAdHocAreTheSame", testAppStoreAndAdHocAreTheSame),
    ("testShouldHaveAnApp", testShouldHaveAnApp),
    ("testReturnsOnlyValidProfileTypes", testReturnsOnlyValidProfileTypes),
    ("testFiltersXcodeManagedProfiles", testFiltersXcodeManagedProfiles),
    ("testIncludesXcodeManagedProfiles", testIncludesXcodeManagedProfiles),
    ("testShouldUseTheXcodeApiToGetProvisioningProfilesAndTheirAppIds", testShouldUseTheXcodeApiToGetProvisioningProfilesAndTheirAppIds),
    ("testShouldUseTheDeveloperPortalApiToGetProvisioningProfilesAndTheirAppIds", testShouldUseTheDeveloperPortalApiToGetProvisioningProfilesAndTheirAppIds),
    ("testFindByBundleIdReturnsEmptyArrayIfThereAreNoProfiles", testFindByBundleIdReturnsEmptyArrayIfThereAreNoProfiles),
    ("testFindByBundleIdReturnsTheProfileInAnArrayIfMatchingForiOS", testFindByBundleIdReturnsTheProfileInAnArrayIfMatchingForiOS),
    ("testFindByBundleIdReturnsTheProfileInAnArrayIfMatchingForTvOS", testFindByBundleIdReturnsTheProfileInAnArrayIfMatchingForTvOS),
    ("testDistributionMethodStaysAppStoreEvenThoughItsAnAdHocProfileWhichContainsDevices", testDistributionMethodStaysAppStoreEvenThoughItsAnAdHocProfileWhichContainsDevices),
    ("testDownloadForAnExistingProvisioningProfile", testDownloadForAnExistingProvisioningProfile),
    ("testDownloadHandlesFailedDownloadRequest", testDownloadHandlesFailedDownloadRequest),
    ("testIsValidTrue", testIsValidTrue),
    ("testIsValidFalse", testIsValidFalse),
    ("testFactoryCreatesADirectProfileTypeForDistributionMethodDirect", testFactoryCreatesADirectProfileTypeForDistributionMethodDirect),
    ("testCreateANewDevelopmentProvisioningProfile", testCreateANewDevelopmentProvisioningProfile),
    ("testCreateANewAppstoreProvisioningProfile", testCreateANewAppstoreProvisioningProfile),
    ("testCreateAProvisioningProfileWithOnlyTheRequiredParametersAndAutoFillsAllAvailableDevices", testCreateAProvisioningProfileWithOnlyTheRequiredParametersAndAutoFillsAllAvailableDevices),
    ("testErrorThrownIfTheUserWantsToCreateAProfileForANonExistingApp", testErrorThrownIfTheUserWantsToCreateAProfileForANonExistingApp),
    ("testDirectOrMacProfileTypesHaveNoDevices", testDirectOrMacProfileTypesHaveNoDevices),
    ("testDevelopmentProfileTypesHaveDevices", testDevelopmentProfileTypesHaveDevices),
    ("testAdHocProfileTypesHaveNoDevices", testAdHocProfileTypesHaveNoDevices),
    ("testAppStoreProfileTypesHaveNoDevices", testAppStoreProfileTypesHaveNoDevices),
    ("testDeleteAnExistingProfile", testDeleteAnExistingProfile),
    ("testRepairAnExistingProfileWithAddedDevices", testRepairAnExistingProfileWithAddedDevices),
    ("testRepairUpdatesTheCertificateIfTheCurrentOneDoesntExist", testRepairUpdatesTheCertificateIfTheCurrentOneDoesntExist),
    ("testRepairUpdatesTheCertificateIfTheCurrentOneIsInvalid", testRepairUpdatesTheCertificateIfTheCurrentOneIsInvalid),
    ("testRepairAnExistingProfileWithNoDevices", testRepairAnExistingProfileWithNoDevices),
    ("testDifferentEnvironmentsDevelopment", testDifferentEnvironmentsDevelopment),
    ("testUpdateAnExistingiOSProfile", testUpdateAnExistingiOSProfile),
    ("testUpdateAnExistingTvOSProfile", testUpdateAnExistingTvOSProfile),
    ("testIsAdhocReturnsTrueWhenTheProfileIsAdhoc", testIsAdhocReturnsTrueWhenTheProfileIsAdhoc),
    ("testIsAdhocReturnsTrueWhenTheProfileIsAppstoreWithDevices", testIsAdhocReturnsTrueWhenTheProfileIsAppstoreWithDevices),
    ("testIsAdhocReturnsFalseWhenTheProfileIsAppstoreWithNoDevices", testIsAdhocReturnsFalseWhenTheProfileIsAppstoreWithNoDevices),
    ("testIsAdhocReturnsFalseWhenTheProfileIsDevelopment", testIsAdhocReturnsFalseWhenTheProfileIsDevelopment),
    ("testIsAdhocReturnsFalseWhenTheProfileIsInhouse", testIsAdhocReturnsFalseWhenTheProfileIsInhouse)
  ]
}

extension RetryTests {
  static var allTests: [(String, (RetryTests) -> () throws -> Void)] = [
    ("testReRaisesWhenRetryLimitReachedThrowingTimeoutError", testReRaisesWhenRetryLimitReachedThrowingTimeoutError),
    ("testReRaisesWhenRetryLimitReachedThrowingConnectionFailed", testReRaisesWhenRetryLimitReachedThrowingConnectionFailed),
    ("testRetriesWhenTimeoutErrorThrown", testRetriesWhenTimeoutErrorThrown),
    ("testRetriesWhenConnectionFailedErrorThrown", testRetriesWhenConnectionFailedErrorThrown),
    ("testRaisesAppleTimeoutErrorWhenResponseContains302Found", testRaisesAppleTimeoutErrorWhenResponseContains302Found),
    ("testSuccessfullyRetriesRequestAfterLoggingInAgainWhenUnauthorizedAccessErrorThrown", testSuccessfullyRetriesRequestAfterLoggingInAgainWhenUnauthorizedAccessErrorThrown),
    ("testFailsToRetryRequestIfLoginFailsInRetryBlockWhenUnauthorizedAccessErrorThrown", testFailsToRetryRequestIfLoginFailsInRetryBlockWhenUnauthorizedAccessErrorThrown),
    ("testRetryWhenUserAndPasswordNotFetchedFromCredentialManagerIsAbleToRetryAndLoginSuccessfully", testRetryWhenUserAndPasswordNotFetchedFromCredentialManagerIsAbleToRetryAndLoginSuccessfully)
  ]
}

extension ShuttleTests {
  static var allTests: [(String, (ShuttleTests) -> () throws -> Void)] = [
    ("testSelectTeam", testSelectTeam),
    ("testShouldInitializeWithAClient", testShouldInitializeWithAClient),
    ("testDevice", testDevice),
    ("testCertificate", testCertificate),
    ("testProvisioningProfile", testProvisioningProfile),
    ("testApp", testApp),
    ("testAppGroup", testAppGroup)
  ]
}

extension TestFlightTests {
  static var allTests: [(String, (TestFlightTests) -> () throws -> Void)] = [
    ("testExample", testExample)
  ]
}

extension TunesTests {
  static var allTests: [(String, (TunesTests) -> () throws -> Void)] = [
    ("testExample", testExample)
  ]
}

extension TwoStepAuthTests {
  static var allTests: [(String, (TwoStepAuthTests) -> () throws -> Void)] = [
    ("testExample", testExample)
  ]
}

XCTMain([
  testCase(BuildStateTests.allTests),
  testCase(BuildTests.allTests),
  testCase(DecodableTests.allTests),
  testCase(LauncherTests.allTests),
  testCase(PersistentCookieTests.allTests),
  testCase(PortalTests.allTests),
  testCase(ProvisioningProfileTests.allTests),
  testCase(RetryTests.allTests),
  testCase(ShuttleTests.allTests),
  testCase(TestFlightTests.allTests),
  testCase(TunesTests.allTests),
  testCase(TwoStepAuthTests.allTests),
])
