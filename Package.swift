// swift-tools-version: 6.2
import PackageDescription

let package = Package(
    name: "swift-iso-9899",
    platforms: [
        .macOS(.v26),
        .iOS(.v26),
        .tvOS(.v26),
        .watchOS(.v26),
        .visionOS(.v26)
    ],
    products: [
        // Core: errno, string memory ops, math - minimal libc surface
        .library(
            name: "ISO 9899 Core",
            targets: ["ISO 9899 Core"]
        ),
        // Full: Core + ctype, stdlib allocation/environment
        .library(
            name: "ISO 9899",
            targets: ["ISO 9899"]
        )
    ],
    dependencies: [
        .package(path: "../../swift-primitives/swift-error-primitives")
    ],
    targets: [
        // MARK: - C Shim Modules (Core)

        .target(
            name: "CISO9899Math",
            dependencies: [],
            publicHeadersPath: "include"
        ),
        .target(
            name: "CISO9899Errno",
            dependencies: [],
            publicHeadersPath: "include"
        ),
        .target(
            name: "CISO9899String",
            dependencies: [],
            publicHeadersPath: "include"
        ),

        // MARK: - C Shim Modules (Hosted)

        .target(
            name: "CISO9899Ctype",
            dependencies: [],
            publicHeadersPath: "include"
        ),
        .target(
            name: "CISO9899Stdlib",
            dependencies: [],
            publicHeadersPath: "include"
        ),

        // MARK: - Swift Targets

        // Core: errno, string memory ops, math
        // Suitable for minimal/embedded-like environments with OS libc
        .target(
            name: "ISO 9899 Core",
            dependencies: [
                "CISO9899Math",
                "CISO9899Errno",
                "CISO9899String",
                .product(name: "Error Primitives", package: "swift-error-primitives")
            ],
            path: "Sources/ISO 9899 Core",
            swiftSettings: [
                .enableExperimentalFeature("Lifetimes")
            ]
        ),

        // Hosted: Core + ctype, stdlib (allocation, environment)
        // Requires full hosted OS environment
        .target(
            name: "ISO 9899 Hosted",
            dependencies: [
                "ISO 9899 Core",
                "CISO9899Ctype",
                "CISO9899Stdlib"
            ],
            path: "Sources/ISO 9899 Hosted",
            swiftSettings: [
                .enableExperimentalFeature("Lifetimes")
            ]
        ),

        // Umbrella: Re-exports everything
        .target(
            name: "ISO 9899",
            dependencies: ["ISO 9899 Hosted"],
            path: "Sources/ISO 9899"
        ),

        // MARK: - Tests
        .testTarget(
            name: "ISO 9899 Tests",
            dependencies: [
                "ISO 9899",
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
        .enableExperimentalFeature("SuppressedAssociatedTypes"),
    ]

    let package: [SwiftSetting] = []

    target.swiftSettings = (target.swiftSettings ?? []) + ecosystem + package
}
