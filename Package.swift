// swift-tools-version: 5.5

import PackageDescription

let package = Package(
  name: "swift-http-utils",
  platforms: [.iOS(.v13), .macCatalyst(.v13), .macOS(.v10_15)],
  products: [
    .library(name: "HTTPUtils", targets: ["HTTPUtils"]),
  ],
  targets: [
    .target(name: "HTTPUtils"),
    .testTarget(name: "HTTPUtilsTests", dependencies: ["HTTPUtils"]),
  ]
)
