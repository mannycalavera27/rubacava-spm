// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Rubacava",
    platforms: [
        .iOS(.v13),
    ],
    products: [
        .library(name: "Rubacava", targets: ["Rubacava"]),
    ],
    dependencies: [
        .package(url: "https://github.com/SDWebImage/SDWebImage", from: "5.10.3")
    ],
    targets: [
        .target(name: "Rubacava", dependencies: ["SDWebImage"]),
        .testTarget(name: "RubacavaTests", dependencies: ["Rubacava"]),
    ]
)
