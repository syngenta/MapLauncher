// swift-tools-version: 5.8

import PackageDescription

let package = Package(
    name: "MapLauncher",
    platforms: [.iOS(.v11)],
    products: [.library(name: "MapLauncher", targets: ["MapLauncher"])],
    targets: [.target(name: "MapLauncher")],
    swiftLanguageVersions: [.v5]
)
