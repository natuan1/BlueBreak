// swift-tools-version: 6.0
import PackageDescription

let package = Package(
    name: "BlueBreakPersistence",
    platforms: [.macOS(.v14)],
    products: [
        .library(name: "BlueBreakPersistence", targets: ["BlueBreakPersistence"])
    ],
    dependencies: [
        .package(path: "../BlueBreakApplication")
    ],
    targets: [
        .target(
            name: "BlueBreakPersistence",
            dependencies: [.product(name: "BlueBreakApplication", package: "BlueBreakApplication")],
            path: "Sources"
        ),
        .testTarget(
            name: "BlueBreakPersistenceTests",
            dependencies: ["BlueBreakPersistence"],
            path: "Tests"
        ),
    ],
    swiftLanguageModes: [.v6]
)
