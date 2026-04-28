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
            url: "https://fillr.jfrog.io/artifactory/fillr-ios-swift/prod/FillrAPI/FillrAPIFramework-4.0.0.zip",
            checksum: "7a9bc42631c7bcb99368b3a63a0725ea5937bbf5cc9803a9a428d01123d6917c"
        ),
        .binaryTarget(
            name: "FillrAnalytics",
            url: "https://fillr.jfrog.io/artifactory/fillr-ios-swift/prod/FillrAnalytics/FillrAnalyticsFramework-4.0.0.zip",
            checksum: "658769c6bf6793d86be90b91283673af6a139eee63c3eef244d776c5e880a750"
        ),
        .binaryTarget(
            name: "FillrSDK",
            url: "https://fillr.jfrog.io/artifactory/fillr-ios-swift/prod/FillrSDK/FillrSDKFramework-4.0.0.zip",
            checksum: "019456b30b2f73333f2252dd072a15a987e751d228dcf0f3f530a8707043f45d"
        ),
        .binaryTarget(
            name: "FillrAutofillSDK",
            url: "https://fillr.jfrog.io/artifactory/fillr-ios-swift/prod/FillrAutofillSDK/FillrAutofillSDKFramework-4.0.0.zip",
            checksum: "f8c96514b53e7f8779c6a45406a92a0e544397c3a82da5b4dc8d9a3e8356d797"
        ),
        .binaryTarget(
            name: "FillrCartScraperSDK",
            url: "https://fillr.jfrog.io/artifactory/fillr-ios-swift/prod/FillrCartScraperSDK/FillrCartScraperSDKFramework-4.0.0.zip",
            checksum: "1c5af7424893245ceb6465b7f2bd16db7a9c587a9bc908057046d5e92642c549"
        )
    ]
)
