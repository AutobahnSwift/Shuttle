<h1 align="center">Shuttle</h1>

<p align="center">
    <a href="https://travis-ci.org/kdawgwilk/Shuttle/branches">
        <img src="https://img.shields.io/travis/kdawgwilk/Shuttle.svg" alt="Travis status" />
    </a>
    <a href="https://travis-ci.org/kdawgwilk/Shuttle/branches">
        <img src="https://img.shields.io/circleci/project/github/kdawgwilk/Shuttle.svg" alt="CircleCI status" />
    </a>
    <!-- <a href=""> -->
        <img src="https://img.shields.io/codecov/c/github/kdawgwilk/Shuttle.svg" alt="Code coverage" />
    <!-- </a> -->
    <!-- <a href=""> -->
        <img src="https://img.shields.io/badge/version-0.1.0-blue.svg" alt="Version" />
    <!-- </a> -->
    <a href="https://swift.org">
        <img src="http://img.shields.io/badge/swift-4.0-brightgreen.svg" alt="Swift 4.0">
    </a>
    <a href="https://kdawgwilk.github.com/shuttle/docs">
        <img src="http://img.shields.io/badge/read_the-docs-lightgrey.svg" alt="Docs">
    </a>
    <a href="https://github.com/kdawgwilk/Shuttle/blob/master/LICENSE">
        <img src="https://img.shields.io/badge/license-MIT-green.svg" alt="License" />
    </a>
    <a href="https://twitter.com/kdawgwilk">
        <img src="https://img.shields.io/badge/contact-@Kdawgwilk-blue.svg" alt="Twitter: @kdawgwilk" />
    </a>
</p>

This basically a port of fastlane's [spaceship](https://github.com/fastlane/fastlane/tree/master/spaceship) which is an HTTP client for interacting with the Apple Developer portal and iTunesConnect.

>NOTE: This is still a work in progress and there is still much to do, here is a rough list of things I would like to see in the near future

## Example

To see an example of the currently available APIs available see [Sources/Development/main.swift](Sources/ShuttleDevelopment/main.swift)

### ToDO List:

- [ ] Support all API endpoints [listed below](#api-endpoints)
- [ ] >90% Code Coverage
- [ ] CLI tool


## API Endpoints

Overview of the used API endpoints

- `https://idmsa.apple.com`: Used to authenticate to get a valid session
- `https://developerservices2.apple.com`:
  - Get a list of all available provisioning profiles
  - Register new devices
- `https://developer.apple.com`:
  - List all devices, certificates, apps and app groups
  - Create new certificates, provisioning profiles and apps
  - Disable/enable services on apps and assign them to app groups
  - Delete certificates and apps
  - Repair provisioning profiles
  - Download provisioning profiles
  - Team selection
- `https://itunesconnect.apple.com`:
  - Managing apps
  - Managing beta testers
  - Submitting updates to review
  - Managing app metadata
- `https://du-itc.itunesconnect.apple.com`:
  - Upload icons, screenshots, trailers ...


## Contributing

To get things running locally after cloning the repo:

```
$ swift package --enable-prefetching generate-xcodeproj
$ open Shuttle.xcodeproj
```

If you want to be able to run the [Sources/ShuttleDevelopment/main.swift](Sources/ShuttleDevelopment/main.swift) file to test changes you just need to switch to use the `Development` scheme in Xcode and then edit the scheme settings and add two environment variables for `USERNAME` and `PASSWORD` (don't worry the Xcode project is in the gitignore so you won't accidently push up your credentials to the repo)

