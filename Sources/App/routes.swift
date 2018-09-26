import Vapor

struct UserData: Content {
    
    var email: String
    var password: String
    
}

struct DataResponse: Content{
    
    var request: UserData
    
}

/// Register your application's routes here.
public func routes(_ router: Router) throws {
    
    let menu = [
        "Chicken Kobob": "$5.00",
        "Sausage Kobob": "$5.00",
        "Steak Kobob": "$6.00",
        "Shrimp Kobob": "$7.00",
        "Veggie Kobob": "$5.00"
        
    ]
    
    
    router.get("menu") { req in
        return menu
    }
    
    router.post("info"){ req -> DataResponse in
        let data = UserData(email:"email@email.com", password: "pwd")
            print(data.email) // user@vapor.codes
            print(data.password) // don't look!
            
            return DataResponse(request: data)
        }
    

    
    /*Working Post Request
    router.post("userInfo"){ req -> Future<HTTPStatus> in
        return try req.content.decode(UserData.self).map(to: HTTPStatus.self){ data in
            
            let data = UserData(email: "email@email.com", password: "pwd")
            print(data.email) // user@vapor.codes
            print(data.password) // don't look!
            
            return .ok
    }
}*/
    

    
    
    // Example of configuring a controller
    /*let todoController = TodoController()
    router.get("todos", use: todoController.index)
    router.post("todos", use: todoController.create)
    router.delete("todos", Todo.parameter, use: todoController.delete)*/
}
