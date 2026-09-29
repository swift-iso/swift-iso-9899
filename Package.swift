// swift-tools-version: 6.4
import PackageDescription

let package = Package(
    name: "swift-iso-9899",
    platforms: [
        .macOS(.v27),
        .iOS(.v27),
        .tvOS(.v27),
        .watchOS(.v27),
        .visionOS(.v27),
    ],
    products: [

        .library(
            name: "ISO 9899 Core",
            targets: ["ISO 9899 Core"]
        ),

        .library(
            name: "ISO 9899",
            targets: ["ISO 9899"]
        ),
    ],
    dependencies: [
        .package(
            url: "https://github.com/swift-atoms/swift-error.git",
            branch: "main"
        ),
        .package(
            url: "https://github.com/swift-atoms/swift-ownership.git",
            branch: "main"
        ),
    ],
    targets: [

        .target(
            name: "ISO 9899 Math Shims",
            dependencies: [],
            publicHeadersPath: "include"
        ),
        .target(
            name: "ISO 9899 Errno Shims",
            dependencies: [],
            publicHeadersPath: "include"
        ),
        .target(
            name: "ISO 9899 String Shims",
            dependencies: [],
            publicHeadersPath: "include"
        ),

        .target(
            name: "ISO 9899 Ctype Shims",
            dependencies: [],
            publicHeadersPath: "include"
        ),
        .target(
            name: "ISO 9899 Stdlib Shims",
            dependencies: [],
            publicHeadersPath: "include"
        ),

        .target(
            name: "ISO 9899 Core",
            dependencies: [
                "ISO 9899 Math Shims",
                "ISO 9899 Errno Shims",
                "ISO 9899 String Shims",
                .product(name: "Error", package: "swift-error"),
                .product(name: "Ownership", package: "swift-ownership"),
            ],
            path: "Sources/ISO 9899 Core",
            swiftSettings: [
                .enableExperimentalFeature("Lifetimes")
            ]
        ),

        .target(
            name: "ISO 9899 Hosted",
            dependencies: [
                "ISO 9899 Core",
                "ISO 9899 Ctype Shims",
                "ISO 9899 Stdlib Shims",
            ],
            path: "Sources/ISO 9899 Hosted",
            swiftSettings: [
                .enableExperimentalFeature("Lifetimes")
            ]
        ),

        .target(
            name: "ISO 9899",
            dependencies: ["ISO 9899 Hosted"],
            path: "Sources/ISO 9899"
        ),

        .testTarget(
            name: "ISO 9899 Tests",
            dependencies: [
                "ISO 9899"
            ]
        ),
    ],
    swiftLanguageModes: [.v6]
)

for target in package.targets where ![.system, .binary, .plugin, .macro].contains(target.type) {
    let ecosystem: [SwiftSetting] = [
        .strictMemorySafety(),
        .enableUpcomingFeature("ExistentialAny"),
        .enableUpcomingFeature("InternalImportsByDefault"),
        .enableUpcomingFeature("MemberImportVisibility"),
        .enableUpcomingFeature("NonisolatedNonsendingByDefault"),
        .enableExperimentalFeature("Lifetimes"),
    ]

    let package: [SwiftSetting] = []

    target.swiftSettings = (target.swiftSettings ?? []) + ecosystem + package
}
