// swift-tools-version:4.0
import PackageDescription

let package = Package(
    name: "vape",
    dependencies: [
        // 💧 A server-side Swift web framework.
        .package(url: "https://github.com/vapor/vapor.git", from: "3.0.0"),

        //PostgreSQL Database
        .package(url: "https://github.com/vapor/fluent-postgresql.git", from: "1.0.0-rc"),
        
        //Kuery - Enables Postgresql queries
        .package(url: "https://github.com/IBM-Swift/Swift-Kuery-PostgreSQL.git", from: "1.2.0"),
        .package(url: "https://github.com/IBM-Swift/Swift-Kuery-ORM.git", from: "0.3.1")
    ],
    targets: [
        .target(name: "App", dependencies: ["FluentPostgreSQL", "Vapor", "SwiftKueryORM", "SwiftKueryPostgreSQL"]),
        .target(name: "Run", dependencies: ["App"]),
        .testTarget(name: "AppTests", dependencies: ["App"])
    ]
)

