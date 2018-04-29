import Shuttle
import Foundation

do {
    // MARK: - DevPortal API

    // MARK: - Login

    let env = ProcessInfo.processInfo.environment

    try Shuttle.DevPortal.login(username: env["USERNAME"]!, password: env["PASSWORD"]!)
    try Shuttle.DevPortal.selectTeam()

    // MARK: - Apps

    // Fetch all available apps
    _ = try Shuttle.DevPortal.app.all()

    // Find a specific app based on the bundle identifier
    _ = try Shuttle.DevPortal.app.find(bundleId: "com.kdawgwilk.app")

    // Show the names of all your apps
    try Shuttle.DevPortal.app.all().forEach { app in
        print(app.name)
    }

    // Create a new app
    //_ = try Shuttle.DevPortal.app.create(bundleId: "com.kdawgwilk.app_name", name: "Autobahn App")

    // MARK: - App Groups

    // Fetch all existing app groups
    //all_groups = Shuttle.DevPortal.app_group.all
    //
    // Find a specific app group, based on the identifier
    //group = Shuttle.DevPortal.app_group.find("group.com.example.application")
    //
    // Show the names of all the groups
    //Shuttle.DevPortal.app_group.all.collect do |group|
    //group.name
    //end
    //
    // Create a new group
    //group = Shuttle.DevPortal.app_group.create!(group_id: "group.com.example.another",
    //name: "Another group")
    //
    // Associate an app with this group (overwrites any previous associations)
    // Assumes app contains a fetched app, as described above
    //app = app.associate_groups([group])

    // MARK: - Apple Pay Merchants

    // Fetch all existing merchants
    //all_merchants = Shuttle.DevPortal.merchant.all
    //
    // Find a specific merchant, based on the identifier
    //sandbox_merchant = Shuttle.DevPortal.merchant.find("merchant.com.example.application.sandbox")
    //
    // Show the names of all the merchants
    //Shuttle.DevPortal.merchant.all.collect do |merchant|
    //merchant.name
    //end
    //
    // Create a new merchant
    //another_merchant = Shuttle.DevPortal.merchant.create!(bundle_id: "merchant.com.example.another", name: "Another merchant")
    //
    // Delete a merchant
    //another_merchant.delete!
    //
    // Associate an app with merchant/s (overwrites any previous associations)
    // Assumes app contains a fetched app, as described above
    //app = app.associate_merchants([sandbox_merchant, production_merchant])

    // MARK: - Passbook

    // Fetch all existing passbooks
    //all_passbooks = Shuttle.DevPortal.passbook.all
    //
    // Find a specific passbook, based on the identifier
    //passbook = Shuttle.DevPortal.passbook.find("pass.com.example.passbook")
    //
    // Create a new passbook
    //passbook = Shuttle.DevPortal.passbook.create!(bundle_id: 'pass.com.example.passbook', name: 'Fastlane Passbook')
    //
    // Delete a passbook using his identifier
    //passbook = Shuttle.DevPortal.passbook.find("pass.com.example.passbook").delete!

    // MARK: - Certificates

    // Fetch all available certificates (includes signing and push profiles)
    //certificates = Shuttle.DevPortal.certificate.all

    // Code Signing Certificates

    // Production identities
    //prod_certs = Shuttle.DevPortal.certificate.production.all
    //
    // Development identities
    //dev_certs = Shuttle.DevPortal.certificate.development.all
    //
    // Download a certificate
    //cert_content = prod_certs.first.download

    // Push Certificates

    // Production push profiles
    //prod_push_certs = Shuttle.DevPortal.certificate.production_push.all
    //
    // Development push profiles
    //dev_push_certs = Shuttle.DevPortal.certificate.development_push.all
    //
    // Download a push profile
    //cert_content = dev_push_certs.first.download
    //
    // Creating a push certificate
    //
    // Create a new certificate signing request
    //csr, pkey = Shuttle.DevPortal.certificate.create_certificate_signing_request
    //
    // Use the signing request to create a new push certificate
    //Shuttle.DevPortal.certificate.production_push.create!(csr: csr, bundle_id: "com.krausefx.app")

    // Create a Certificate

    // Create a new certificate signing request
    //csr, pkey = Shuttle.DevPortal.certificate.create_certificate_signing_request
    //
    // Use the signing request to create a new distribution certificate
    //Shuttle.DevPortal.certificate.production.create!(csr: csr)

    // MARK: - Provisioning Profiles

    // Recieving profiles

    // Finding
    //
    // Get all available provisioning profiles
    //profiles = Shuttle.DevPortal.provisioning_profile.all
    //
    // Get all App Store and Ad Hoc profiles
    // Both app_store.all and ad_hoc.all return the same
    // This is the case since September 2016, since the API has changed
    // and there is no fast way to get the type when fetching the profiles
    //profiles_appstore_adhoc = Shuttle.DevPortal.provisioning_profile.app_store.all
    //profiles_appstore_adhoc = Shuttle.DevPortal.provisioning_profile.ad_hoc.all
    //
    // To distinguish between App Store and Ad Hoc profiles use
    //adhoc_only = profiles_appstore_adhoc.find_all do |current_profile|
    //current_profile.is_adhoc?
    //end
    //
    // Get all Development profiles
    //profiles_dev = Shuttle.DevPortal.provisioning_profile.development.all
    //
    // Fetch all profiles for a specific app identifier for the App Store (Array of profiles)
    //filtered_profiles = Shuttle.DevPortal.provisioning_profile.app_store.find_by_bundle_id("com.krausefx.app")
    //
    // Check if a provisioning profile is valid
    //profile.valid?
    //
    // Verify that the certificate of the provisioning profile is valid
    //profile.certificate_valid?
    //
    // Downloading
    //
    // Download a profile
    //profile_content = profiles.first.download
    //
    // Download a specific profile as file
    //matching_profiles = Shuttle.DevPortal.provisioning_profile.app_store.find_by_bundle_id("com.krausefx.app")
    //first_profile = matching_profiles.first
    //
    //File.write("output.mobileprovision", first_profile.download)

    // Create a provisioning profile

    // Choose the certificate to use
    //cert = Shuttle.DevPortal.certificate.production.all.first
    //
    // Create a new provisioning profile with a default name
    // The name of the new profile is "com.krausefx.app AppStore"
    //profile = Shuttle.DevPortal.provisioning_profile.app_store.create!(bundle_id: "com.krausefx.app",
    //certificate: cert)
    //
    // AdHoc Profiles will add all devices by default
    //profile = Shuttle.DevPortal.provisioning_profile.ad_hoc.create!(bundle_id: "com.krausefx.app",
    //certificate: cert,
    //name: "Profile Name")
    //
    // Store the new profile on the filesystem
    //File.write("NewProfile.mobileprovision", profile.download)

    // Repair all broken provisioning profiles

    // Select all 'Invalid' or 'Expired' provisioning profiles
    //broken_profiles = Shuttle.DevPortal.provisioning_profile.all.find_all do |profile|
    // the below could be replaced with `!profile.valid? || !profile.certificate_valid?`, which takes longer but also verifies the code signing identity
    //(profile.status == "Invalid" or profile.status == "Expired")
    //end
    //
    // Iterate over all broken profiles and repair them
    //broken_profiles.each do |profile|
    //profile.repair!  yes, that's all you need to repair a profile
    //end
    //
    // or to do the same thing, just more Ruby like
    //Shuttle.DevPortal.provisioning_profile.all.find_all { |p| !p.valid? || !p.certificate_valid? }.map(&:repair!)

    // MARK: - Devices

    // Get all enabled devices
    //all_devices = Shuttle.DevPortal.device.all
    //
    // Disable first device
    //all_devices.first.disable!
    //
    // Find disabled device and enable it
    //Shuttle.DevPortal.device.find_by_udid("44ee59893cb...", include_disabled: true).enable!
    //
    // Get list of all devices, including disabled ones, and filter the result to only include disabled devices use enabled? or disabled? methods
    //disabled_devices = Shuttle.DevPortal.device.all(include_disabled: true).select do |device|
    //!device.enabled?
    //end
    //
    // or to do the same thing, just more Ruby like with disabled? method
    //disabled_devices = Shuttle.DevPortal.device.all(include_disabled: true).select(&:disabled?)
    //
    // Register a new device
    //Shuttle.DevPortal.device.create!(name: "Private iPhone 6", udid: "5814abb3...")

    // MARK: - Enterprise

    // Use the InHouse class to get all enterprise certificates
    //cert = Shuttle.DevPortal.certificate.in_house.all.first
    //
    // Create a new InHouse Enterprise distribution profile
    //profile = Shuttle.DevPortal.provisioning_profile.in_house.create!(bundle_id: "com.krausefx.*",
    //certificate: cert)
    //
    // List all In-House Provisioning Profiles
    //profiles = Shuttle.DevPortal.provisioning_profile.in_house.all

    // MARK: - Multiple Shuttles

    //spaceship1 = Spaceship.Launcher.new("felix@krausefx.com", "password")
    //spaceship2 = Spaceship.Launcher.new("stefan@spaceship.airforce", "password")

} catch let error {
    print("Error thrown: \(error)")
}
