// swift-tools-version:5.8
import PackageDescription

let package = Package(
    name: "TumblrNPF",
    platforms: [
        .iOS(.v15),
        .macOS(.v13)
    ],
    products: [
        .library(name: "TumblrNPF", targets: ["TumblrNPF"])
    ],
    dependencies: [
        .package(url: "git@github.com:janodevorg/CodableHelpers.git", from: "1.0.0"),
        .package(url: "git@github.com:apple/swift-docc-plugin.git", from: "1.1.0")
    ],
    targets: [
        .target(
            name: "TumblrNPF",
            dependencies: [
                .product(name: "CodableHelpers", package: "CodableHelpers"),
            ],
            path: "sources/main"
        ),
        .testTarget(
            name: "TumblrNPFTests",
            dependencies: ["TumblrNPF"],
            path: "sources/tests",
            resources: [
              .process("resources")
            ]
        )
    ]
)
