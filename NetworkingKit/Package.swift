// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "NetworkingKit",
    platforms: [
        .iOS(.v15)
    ],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "NetworkingKit",
            targets: ["NetworkingKit"]),
    ],
    dependencies: [
        
    ],
    targets: [
        .target(
            name: "NetworkingKit",
            dependencies: []
            ,
            path: "Sources",
            resources: [
                .process("NetworkingKit/Mocks/characters.json"),
            ]
        ),
        
        .testTarget(
            name: "NetworkingKitTests",
            dependencies: ["NetworkingKit"]),
    ]
)
