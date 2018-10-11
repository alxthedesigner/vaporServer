import Vapor
import FluentPostgreSQL
import SwiftKueryPostgreSQL
//import SwiftKueryORM



struct DataResponse: Content{
    
    var req: UserData
    
}

final class UserData: Content {
    var id: UUID?

    var name: String
    var email: String
    var password: String
    var school: String
    
    init(name: String, email: String, password: String, school: String) {
        self.name = name
        self.email = email
        self.password = password
        self.school = school
    }
}

extension UserData: PostgreSQLUUIDModel {}
extension UserData: Migration {}




final class MenuData: Content {
    var id: UUID?
    
    var restaurant: String
    var item: String
    var price: Double
    var description: String
    
    init(restaurant: String, item: String, price: Double, description: String) {
        self.restaurant = restaurant
        self.item = item
        self.price = price
        self.description = description
    }
}

extension MenuData: PostgreSQLUUIDModel {}
extension MenuData: Migration {}





//MARK: Routes
public func routes(_ router: Router) throws {

   
    let userController = UserController()
    let menuController = MenuController()
    
    router.get("users", use: userController.index)
    router.post("users", use: userController.create)
    router.get("menu", use: menuController.index)
    router.post("menu", use: menuController.create)
    
    //router.delete("todos", Todo.parameter, use: todoController.delete)*/
}
