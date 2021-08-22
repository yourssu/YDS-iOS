// swift-tools-version:5.3
import PackageDescription
 
let package = Package(
    name: "YDS",

    platforms: [
        .iOS(.v13)
    ],
    
    products: [
        .library(
            name: "YDS",
            targets: ["YDS"]),
    ],
    
    dependencies: [
        .package(name: "PanModal", url: "https://github.com/slackhq/PanModal.git", from: "1.0.0"),
        .package(name: "SnapKit", url: "https://github.com/SnapKit/SnapKit", from: "5.0.0"),
    ],

    targets: [
        .target(
            name: "YDS",
            dependencies: [
                .product(name: "PanModal", package: "PanModal"),
                .product(name: "SnapKit", package: "SnapKit"),
            ],
            path: "YDS/Source",
            resources: [.process("YDS/Source/Foundation/YDSIcon.xcassets")]
        )
    ]
)

