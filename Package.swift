// swift-tools-version:5.6
import PackageDescription

let package = Package(
    name: "TumblrNPF",
    platforms: [
        .iOS(.v15)
    ],
    products: [
        .library(name: "TumblrNPF", type: .static, targets: ["TumblrNPF"]),
        .library(name: "TumblrNPFDynamic", type: .dynamic, targets: ["TumblrNPF"])
    ],
    dependencies: [
        .package(url: "git@github.com:janodevorg/CodableHelpers.git", from: "1.0.0"),
        .package(url: "git@github.com:apple/swift-docc-plugin.git", from: "1.0.0")
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
