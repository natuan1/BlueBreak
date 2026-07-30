// swift-tools-version: 6.0
import PackageDescription

let package = Package(
    name: "BlueBreakDesignSystem",
    platforms: [.macOS(.v14)],
    products: [
        .library(name: "BlueBreakDesignSystem", targets: ["BlueBreakDesignSystem"])
    ],
    targets: [
        .target(name: "BlueBreakDesignSystem", path: "Sources"),
        .testTarget(
            name: "BlueBreakDesignSystemTests",
            dependencies: ["BlueBreakDesignSystem"],
            path: "Tests"
        ),
    ],
    swiftLanguageModes: [.v6]
)
