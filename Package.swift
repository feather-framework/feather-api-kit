// swift-tools-version:5.9
import PackageDescription

let package = Package(
    name: "feather-api-kit",
    platforms: [
        .macOS(.v14),
        .iOS(.v17),
        .tvOS(.v17),
        .watchOS(.v10),
        .visionOS(.v1),
    ],
    products: [
        .library(name: "FeatherOpenAPIGeneratorKit", targets: ["FeatherOpenAPIGeneratorKit"]),
    ],
    dependencies: [
        .package(url: "https://github.com/feather-framework/feather-openapi-kit", .upToNextMinor(from: "0.9.0")),
        .package(url: "https://github.com/jpsim/Yams", from: "5.0.0"),
    ],
    targets: [
        .target(
            name: "FeatherOpenAPIGeneratorKit",
            dependencies: [
                .product(name: "FeatherOpenAPIKit", package: "feather-openapi-kit"),
                .product(name: "FeatherOpenAPIKitMacros", package: "feather-openapi-kit"),
            ],
            plugins: [
                .plugin(name: "FeatherOpenAPIGenerator", package: "feather-openapi-kit")
            ]
        ),

        .executableTarget(
            name: "TestOpenAPIGenerator",
            dependencies: [
                .product(name: "Yams", package: "Yams"),
                .product(name: "FeatherOpenAPIKit", package: "feather-openapi-kit"),
                .product(name: "FeatherOpenAPIKitMacros", package: "feather-openapi-kit"),
                .target(name: "FeatherOpenAPIGeneratorKit"),
            ]
        ),
        
        .testTarget(
            name: "FeatherOpenAPIGeneratorKitTests",
            dependencies: [
                .target(name: "FeatherOpenAPIGeneratorKit"),
            ]
        ),
    ]
)
