// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "LTUI",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(
            name: "LTUI",
            targets: ["LTUI"]),
    ],
    dependencies: [
        .package(url: "https://github.com/SnapKit/SnapKit.git", from: "5.0.0") // Add SnapKit dependency
    ],
    targets: [
        .target(
            name: "LTUI",
            dependencies: ["SnapKit"]),
        .testTarget(
            name: "LTUITests",
            dependencies: ["LTUI"]),
    ]
)
