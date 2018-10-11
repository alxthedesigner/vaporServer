import Vapor
import Foundation

struct PostgreSQLVersion: Codable {
    let version: String
}


 //GET retrieving function
final class UserController {
    func index(_ req: Request) throws -> Future<[UserData]> {
        return UserData.query(on: req).all()

    }
    
    //POST saving function
    func create(_ req: Request) throws -> Future<UserData> {
        return try req.content.decode(UserData.self).flatMap { user in
            return user.save(on: req)
        }
    }
    
}
