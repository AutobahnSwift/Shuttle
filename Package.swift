// swift-tools-version:4.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Shuttle",
    products: [
        .library(name: "Shuttle", targets: ["Shuttle"]),
    ],
    dependencies: [
         .package(url: "https://github.com/devxoul/MoyaSugar.git", .upToNextMajor(from: "1.1.0")),
         .package(url: "https://github.com/Moya/Moya.git", .upToNextMajor(from: "10.0.2")),
         .package(url: "https://github.com/onevcat/Rainbow", from: "3.0.0"),
    ],
    targets: [
        .target(name: "Development", dependencies: ["Shuttle"]),
        .target(name: "Shuttle", dependencies: ["TestFlight", "Tunes", "DevPortal"]),
        .target(name: "TestFlight", dependencies: ["Core"]),
        .target(name: "Tunes", dependencies: ["Core"]),
        .target(name: "DevPortal", dependencies: ["Core"]),
        .target(name: "Core", dependencies: ["MoyaSugar", "Moya", "Rainbow"]),
        .target(name: "TestSupport", dependencies: []),

        .testTarget(name: "ShuttleTests", dependencies: ["Shuttle", "TestSupport"]),
        .testTarget(name: "TestFlightTests", dependencies: ["TestFlight", "TestSupport"]),
        .testTarget(name: "TunesTests", dependencies: ["Tunes", "TestSupport"]),
        .testTarget(name: "DevPortalTests", dependencies: ["DevPortal", "TestSupport"]),
        .testTarget(name: "CoreTests", dependencies: ["Core", "TestSupport"]),
    ],
    swiftLanguageVersions: [3, 4]
)
