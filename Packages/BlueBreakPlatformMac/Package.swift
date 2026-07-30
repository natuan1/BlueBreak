// swift-tools-version: 6.0
import PackageDescription

let package = Package(
    name: "BlueBreakPlatformMac",
    platforms: [.macOS(.v14)],
    products: [
        .library(name: "BlueBreakPlatformMac", targets: ["BlueBreakPlatformMac"])
    ],
    dependencies: [
        .package(path: "../BlueBreakApplication")
    ],
    targets: [
        .target(
            name: "BlueBreakPlatformMac",
            dependencies: [.product(name: "BlueBreakApplication", package: "BlueBreakApplication")],
            path: "Sources"
        ),
        .testTarget(
            name: "BlueBreakPlatformMacTests",
            dependencies: ["BlueBreakPlatformMac"],
            path: "Tests"
        ),
    ],
    swiftLanguageModes: [.v6]
)
