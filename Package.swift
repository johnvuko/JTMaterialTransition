// swift-tools-version:5.5
import PackageDescription

let package = Package(
    name: "JTMaterialTransition",
    platforms: [.iOS(.v9)],
    products: [
        .library(name: "JTMaterialTransition", targets: ["JTMaterialTransition"])
    ],
    targets: [
        .target(name: "JTMaterialTransition", path: "JTMaterialTransition")
    ],
    swiftLanguageVersions: [.v5]
)
