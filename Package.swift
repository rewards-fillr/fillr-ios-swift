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
            checksum: "821f15746a6a4e0f4663eaa3c2e15af280e515e29f6da58dcac6899716e09323"
        ),
        .binaryTarget(
            name: "FillrAnalytics",
            url: "https://fillr.jfrog.io/artifactory/fillr-ios-swift/prod/FillrAnalytics/FillrAnalyticsFramework-4.0.1.zip",
            checksum: "6b53ef299407f388b80746fade22558055a1cf50120ea743f35c22d689c57311"
        ),
        .binaryTarget(
            name: "FillrSDK",
            url: "https://fillr.jfrog.io/artifactory/fillr-ios-swift/prod/FillrSDK/FillrSDKFramework-4.0.1.zip",
            checksum: "8194eb05021ea7157d6e1316508d711b9a58239bab9facac27dd4900cfbf1bdb"
        ),
        .binaryTarget(
            name: "FillrAutofillSDK",
            url: "https://fillr.jfrog.io/artifactory/fillr-ios-swift/prod/FillrAutofillSDK/FillrAutofillSDKFramework-4.0.1.zip",
            checksum: "3d8c9cf992734984b58f120e315197f71703f7bef651371701311a0e041fa6b8"
        ),
        .binaryTarget(
            name: "FillrCartScraperSDK",
            url: "https://fillr.jfrog.io/artifactory/fillr-ios-swift/prod/FillrCartScraperSDK/FillrCartScraperSDKFramework-4.0.1.zip",
            checksum: "498230909871dd4b4a37bfcd6cca73a748503a032afbebd6d95c494af25cd178"
        )
    ]
)
