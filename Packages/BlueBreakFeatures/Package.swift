// swift-tools-version: 6.0
import PackageDescription

let package = Package(
    name: "BlueBreakFeatures",
    platforms: [.macOS(.v14)],
    products: [
        .library(name: "BlueBreakFeatures", targets: ["BlueBreakFeatures"])
    ],
    dependencies: [
        .package(path: "../BlueBreakApplication"),
        .package(path: "../BlueBreakDesignSystem"),
    ],
    targets: [
        .target(
            name: "BlueBreakFeatures",
            dependencies: [
                .product(name: "BlueBreakApplication", package: "BlueBreakApplication"),
                .product(name: "BlueBreakDesignSystem", package: "BlueBreakDesignSystem"),
            ],
            path: "Sources"
        ),
        .testTarget(
            name: "BlueBreakFeaturesTests",
            dependencies: ["BlueBreakFeatures"],
            path: "Tests"
        ),
    ],
    swiftLanguageModes: [.v6]
)
