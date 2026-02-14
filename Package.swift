// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ModdakirSDK",
    platforms: [.iOS(.v14)],
    products: [
        .library(
            name: "ModdakirSDK",
            targets: ["ModdakirSDKWrapper"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/AgoraIO/AgoraAudio_iOS", .upToNextMajor(from: "4.3.1")),
        .package(url: "https://github.com/alexiscreuzot/SwiftyGif", .upToNextMajor(from: "5.4.5"))
    ],
    
    targets: [
        .target(
            name: "ModdakirSDKWrapper",
            dependencies: [
                .target(name: "ModdakirSDK"),
                .target(name: "AgoraRtmKit"),
                .product(name: "NetworkManager", package: "NetworkManager"),
                .product(name: "RtcBasic", package: "AgoraAudio_iOS"),
                .product(name: "SwiftyGif-Dynamic", package: "SwiftyGif")

            ],
            path: "./Sources/ModdakirSDKWrapper"
        ),
        .binaryTarget(
            name: "AgoraRtmKit",
            path: "Sources/AgoraRtmKit.xcframework"
        ),
        .binaryTarget(
            name: "ModdakirSDK",
            path: "Sources/ModdakirSDK.xcframework"
        )
    ]
)
