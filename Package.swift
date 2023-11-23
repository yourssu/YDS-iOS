// swift-tools-version:5.3
import PackageDescription

let package = Package(
    name: "YDS",
    
    platforms: [
        .iOS(.v16)
    ],

    products: [
        .library(
            name: "YDS",
            targets: ["YDS"]
        ),
        .library(
            name: "YDS-SwiftUI",
            targets: ["YDS-SwiftUI"]
        )
    ],

    dependencies: [
        .package(name: "PanModal", url: "https://github.com/slackhq/PanModal.git", from: "1.0.0"),
        .package(name: "SnapKit", url: "https://github.com/SnapKit/SnapKit", from: "5.0.0"),
        .package(name: "Parchment", url: "https://github.com/yourssu/Parchment", from: "3.7.2")
    ],

    targets: [
        .target(
            name: "YDS",
            dependencies: [
                .product(name: "PanModal", package: "PanModal"),
                .product(name: "SnapKit", package: "SnapKit"),
                .product(name: "Parchment", package: "Parchment"),
                .targetItem(name: "YDS-Essential", condition: .none)
            ],
            path: "YDS/Source"
        ),
        .target(
            name: "YDS-SwiftUI",
            dependencies: [
                .targetItem(name: "YDS-Essential", condition: .none)
            ],
            path: "YDS-SwiftUI/Source"
        ),
        .target(
            name: "YDS-Essential",
            dependencies: [],
            path: "YDS-Essential/Source",
            resources: [
                .process("Foundation/YDSBasicColor.xcassets"),
                .process("Foundation/YDSIcon.xcassets")
            ]
        )
    ]
)
