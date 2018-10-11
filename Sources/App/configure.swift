//import FluentSQLite
import Vapor
import FluentPostgreSQL

/// Called before your application initializes.
public func configure(_ config: inout Config, _ env: inout Environment, _ services: inout Services) throws {
    /// Register providers first
    //try services.register(FluentSQLiteProvider())
    MenuData.defaultDatabase = .psql
    try services.register(FluentPostgreSQLProvider())
    
    /// Register routes to the router
    let router = EngineRouter.default()
    try routes(router)
    services.register(router, as: Router.self)

    
    /// Register middleware
    var middlewares = MiddlewareConfig() // Create _empty_ middleware config
    /// middlewares.use(FileMiddleware.self) // Serves files from `Public/` directory
    middlewares.use(ErrorMiddleware.self) // Catches errors and converts to HTTP response
    services.register(middlewares)

    // Configure a SQLite database
    let config = PostgreSQLDatabaseConfig(
        hostname: "localhost",
        port: 5432,
        username: "alexstanford",
        database: "campUsers",
        password: nil
        
    )
    
    let postgres = PostgreSQLDatabase(config: config)
    
    /// Register the configured SQLite database to the database config.
    //let sqlite = try SQLiteDatabase(storage: .memory)
    var databases = DatabasesConfig()
     databases.add(database: postgres, as: .psql)
    services.register(databases)
    

    /// Configure migrations
    var migrations = MigrationConfig()
    migrations.add(model: UserData.self, database: .psql)
    //migrations.add(model: MenuData.self, database: .psql)
    services.register(migrations)

}
