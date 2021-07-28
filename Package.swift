// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "QuickCache",
    platforms: [.macOS(.v10_12), .iOS(.v10), .tvOS(.v10), .watchOS(.v3)],
    products: [
        .library(name: "QuickCache", targets: ["QuickCache"]),
    ],
    dependencies: [
        .package(name: "Cachyr", url: "https://github.com/nrkno/yr-cachyr", from: "1.3.1"),
    ],
    targets: [
        .target(name: "QuickCache", dependencies: ["Cachyr"]),
        .testTarget(name: "QuickCacheTests", dependencies: ["QuickCache"]),
    ]
)
