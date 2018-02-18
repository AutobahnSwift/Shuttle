@testable import Shuttle
import XCTest

class ProvisioningProfileTests: XCTestCase {
    func testAllProperlyRetrievesAndFiltersTheProvisioningProfiles() {

    }

    func testShouldFilterByTheCorrectTypes() {

    }

    func testAppStoreAndAdHocAreTheSame() {

    }

    func testShouldHaveAnApp() {

    }

    func testReturnsOnlyValidProfileTypes() {

    }

    func testFiltersXcodeManagedProfiles() {

    }

    func testIncludesXcodeManagedProfiles() {

    }

    func testShouldUseTheXcodeApiToGetProvisioningProfilesAndTheirAppIds() {

    }

    func testShouldUseTheDeveloperPortalApiToGetProvisioningProfilesAndTheirAppIds() {

    }

    // MARK: - findBy(bundleId:)

    func testFindByBundleIdReturnsEmptyArrayIfThereAreNoProfiles() {

    }

    func testFindByBundleIdReturnsTheProfileInAnArrayIfMatchingForiOS() {

    }

    func testFindByBundleIdReturnsTheProfileInAnArrayIfMatchingForTvOS() {

    }

    func testDistributionMethodStaysAppStoreEvenThoughItsAnAdHocProfileWhichContainsDevices() {

    }

    //MARK: - download

    func testDownloadForAnExistingProvisioningProfile() {

    }

    func testDownloadHandlesFailedDownloadRequest() {

    }

    // MARK: - isValid

    func testIsValidTrue() {

    }

    func testIsValidFalse() {

    }

    // MARK: - factory

    func testFactoryCreatesADirectProfileTypeForDistributionMethodDirect() {

    }

    // MARK: - create

    func testCreateANewDevelopmentProvisioningProfile() {

    }

    func testCreateANewAppstoreProvisioningProfile() {

    }

    func testCreateAProvisioningProfileWithOnlyTheRequiredParametersAndAutoFillsAllAvailableDevices() {

    }

    func testErrorThrownIfTheUserWantsToCreateAProfileForANonExistingApp() {

    }

    // MARK: - modify devices to prevent having devices on profile types where it does not make sense

    func testDirectOrMacProfileTypesHaveNoDevices() {

    }

    func testDevelopmentProfileTypesHaveDevices() {

    }

    func testAdHocProfileTypesHaveNoDevices() {

    }

    func testAppStoreProfileTypesHaveNoDevices() {

    }

    // MARK: - delete

    func testDeleteAnExistingProfile() {

    }

    // MARK: - repair

    func testRepairAnExistingProfileWithAddedDevices() {

    }

    func testRepairUpdatesTheCertificateIfTheCurrentOneDoesntExist() {

    }

    func testRepairUpdatesTheCertificateIfTheCurrentOneIsInvalid() {

    }

    func testRepairAnExistingProfileWithNoDevices() {

    }

    func testDifferentEnvironmentsDevelopment() {

    }

    // MARK: - update

    func testUpdateAnExistingiOSProfile() {

    }

    func testUpdateAnExistingTvOSProfile() {

    }

    // MARK: - isAdhoc

    func testIsAdhocReturnsTrueWhenTheProfileIsAdhoc() {

    }

    func testIsAdhocReturnsTrueWhenTheProfileIsAppstoreWithDevices() {

    }

    func testIsAdhocReturnsFalseWhenTheProfileIsAppstoreWithNoDevices() {

    }

    func testIsAdhocReturnsFalseWhenTheProfileIsDevelopment() {

    }

    func testIsAdhocReturnsFalseWhenTheProfileIsInhouse() {

    }
}
