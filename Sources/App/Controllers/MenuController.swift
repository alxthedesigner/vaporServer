//
//  MenuController.swift
//  App
//
//  Created by Alex Stanford on 10/7/18.
//
import Vapor
import Foundation
import FluentPostgreSQL
//import SwiftKueryPostgreSQL

final class MenuController {
    
    //GET retrieving function
    func index(_ req: Request) throws -> Future<[MenuData]> {
       return MenuData.query(on: req).all()
       
    }
    
    //POST saving function
   func create(_ req: Request) throws -> Future<MenuData> {
        return try req.content.decode(MenuData.self).flatMap { menu in
            return menu.save(on: req)
        }
    }
}
