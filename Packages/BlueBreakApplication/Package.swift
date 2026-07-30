// swift-tools-version: 6.0
import PackageDescription

let package = Package(
    name: "BlueBreakApplication",
    platforms: [.macOS(.v14)],
    products: [
        .library(name: "BlueBreakApplication", targets: ["BlueBreakApplication"])
    ],
    dependencies: [
        .package(path: "../BlueBreakDomain")
    ],
    targets: [
        .target(
            name: "BlueBreakApplication",
            dependencies: [.product(name: "BlueBreakDomain", package: "BlueBreakDomain")],
            path: "Sources"
        ),
        .testTarget(
            name: "BlueBreakApplicationTests",
            dependencies: ["BlueBreakApplication"],
            path: "Tests"
        ),
    ],
    swiftLanguageModes: [.v6]
)
