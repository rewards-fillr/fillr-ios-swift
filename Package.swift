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
            checksum: "1f1db86187c199172d51578d38d4fc2bf009979bba2c4783a64cc9ae88202d95"
        ),
        .binaryTarget(
            name: "FillrAnalytics",
            url: "https://fillr.jfrog.io/artifactory/fillr-ios-swift/prod/FillrAnalytics/FillrAnalyticsFramework-4.0.1.zip",
            checksum: "3937a00942a25c41e0d90b8c72148a36eb37275ae8b88ecea85eff194c0dcc01"
        ),
        .binaryTarget(
            name: "FillrSDK",
            url: "https://fillr.jfrog.io/artifactory/fillr-ios-swift/prod/FillrSDK/FillrSDKFramework-4.0.1.zip",
            checksum: "d5491347abdc99535a2453b90717c46dd538d5e3dea71852ea3e4572fa104f96"
        ),
        .binaryTarget(
            name: "FillrAutofillSDK",
            url: "https://fillr.jfrog.io/artifactory/fillr-ios-swift/prod/FillrAutofillSDK/FillrAutofillSDKFramework-4.0.1.zip",
            checksum: "78b519d15f1911811ea6d3c203f592cb4da2c06131ef36b126c63af261f8af73"
        ),
        .binaryTarget(
            name: "FillrCartScraperSDK",
            url: "https://fillr.jfrog.io/artifactory/fillr-ios-swift/prod/FillrCartScraperSDK/FillrCartScraperSDKFramework-4.0.1.zip",
            checksum: "8dedd57c4cb251085c24e390508b767a7dfd196e08b02311a8edca60d5eb8ffb"
        )
    ]
)
