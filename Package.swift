// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Advent of Code",
    platforms: [.macOS(.v10_14)],
    products: [
        // Products define the executables and libraries produced by a package, and make them visible to other packages.
//        .executable(name: "advent", targets: ["advent"]),
        .library(name: "AOCHelper", targets: ["AOCHelper"]),
        .library(name: "AOC2019", targets: ["AOC2019"]),
        .library(name: "AOC2020", targets: ["AOC2020"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages which this package depends on.
//        .target(name: "advent", dependencies: ["AOC"]),

//        .target(name: "AOC", dependencies: ["AOCCore", "AOC2019"]),



        .target(name: "AOCHelper", dependencies: []),

        .target(name: "AOC2019", dependencies: ["AOCHelper"]),
        .testTarget(name: "AOC2019Tests", dependencies: ["AOC2019"]),
        
        .target(name: "AOC2020", dependencies: ["AOCHelper"]),
        .testTarget(name: "AOC2020Tests", dependencies: ["AOC2020"]),
    ]
)
