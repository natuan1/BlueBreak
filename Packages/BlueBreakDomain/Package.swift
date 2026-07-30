// swift-tools-version: 6.0
import PackageDescription

let package = Package(
    name: "BlueBreakDomain",
    platforms: [.macOS(.v14)],
    products: [
        .library(name: "BlueBreakDomain", targets: ["BlueBreakDomain"])
    ],
    targets: [
        .target(name: "BlueBreakDomain", path: "Sources"),
        .testTarget(name: "BlueBreakDomainTests", dependencies: ["BlueBreakDomain"], path: "Tests"),
    ],
    swiftLanguageModes: [.v6]
)
