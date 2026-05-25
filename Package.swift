// swift-tools-version:5.3
import PackageDescription

let package = Package(
    name: "FillrSDK",
    platforms: [.iOS(.v13)],
    products: [
        .library(name: "FillrAutofillSDK", targets: ["FillrAutofillSDK", "FillrSDK", "FillrAPI", "FillrAnalytics"]),
        .library(name: "FillrCartScraperSDK", targets: ["FillrCartScraperSDK", "FillrSDK", "FillrAPI", "FillrAnalytics"]),
    ],
    targets: [
        .binaryTarget(
            name: "FillrAPI",
            url: "https://fillr.jfrog.io/artifactory/fillr-ios-swift/prod/FillrAPI/FillrAPIFramework-4.0.1.zip",
            checksum: "df26d1e0b6b3aee705e5abc7a186ac3222fe02758efd02aa67249caaa0b1aa7e"
        ),
        .binaryTarget(
            name: "FillrAnalytics",
            url: "https://fillr.jfrog.io/artifactory/fillr-ios-swift/prod/FillrAnalytics/FillrAnalyticsFramework-4.0.1.zip",
            checksum: "3327811b66d7b60fe7560a219946e28f3b19a83b28f5893a2797cbe8acd4b627"
        ),
        .binaryTarget(
            name: "FillrSDK",
            url: "https://fillr.jfrog.io/artifactory/fillr-ios-swift/prod/FillrSDK/FillrSDKFramework-4.0.1.zip",
            checksum: "0e1a602531c211cc36986b22e3e80c960886afcdbe381fd029cd79ba2a869ad9"
        ),
        .binaryTarget(
            name: "FillrAutofillSDK",
            url: "https://fillr.jfrog.io/artifactory/fillr-ios-swift/prod/FillrAutofillSDK/FillrAutofillSDKFramework-4.0.1.zip",
            checksum: "6634d2390e3b6d0771b9db1796596023333b60182ce3235caa151f4ec155870a"
        ),
        .binaryTarget(
            name: "FillrCartScraperSDK",
            url: "https://fillr.jfrog.io/artifactory/fillr-ios-swift/prod/FillrCartScraperSDK/FillrCartScraperSDKFramework-4.0.1.zip",
            checksum: "a0b069a0eecdc402eedaf9c90e8dbab520e0734d1b1458669af850ab111c5fad"
        )
    ]
)
