// swift-tools-version:5.0

import PackageDescription

let package = Package(
  name: "Ariel",
  platforms: [
    .macOS(.v10_11)
  ],
  products: [
    .executable(name: "Ariel", targets: ["Ariel"])
  ],
  dependencies: [
    // 0.50500.0 -> swift-5.5-RELEASE -> Xcode 13.0
    .package(url: "https://github.com/apple/swift-syntax.git", .exact("0.50500.0")),
    .package(url: "https://github.com/apple/swift-argument-parser", .upToNextMinor(from: "0.4.0"))
  ],
  targets: [
    // We need a separate 'ArielLib' to be able to write unit tests.
    .target(name: "ArielLib", dependencies: ["SwiftSyntax", "ArgumentParser"]),
    .target(name: "Ariel", dependencies: ["ArielLib"]),
    .testTarget(name: "ArielTests", dependencies: ["ArielLib"])
  ]
)
