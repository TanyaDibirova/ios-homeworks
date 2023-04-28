//
//  User.swift
//  Navigation
//
//  Created by MacBook on 24.04.2023.
//

import Foundation
import UIKit

class User: UserService {
    
    var login: String
    var fullName: String
    var avatar: UIImage?
    var status: String
    
    init(login: String, fullName: String, avatar: UIImage?, status: String){
    
    self.login = login
    self.fullName = fullName
    self.avatar = avatar
    self.status = status
    }
    func userService (login: String) -> User? {
        self
    }
}

protocol UserService {
    func userService (login: String) -> User?
}

class CurrentUserService: UserService {
    var user = User(login: "tanya8", fullName: "Dibirova Tanya", avatar: UIImage(named: "14")!, status: "Happiness is a state of activity")
    
    func userService(login: String) -> User? {
        print(login)
        if login == user.login {
            return user
        }
        return nil
    }
}

class TestUserService: UserService {

    var testUser = User(login: "000", fullName: "Test User", avatar: UIImage(named: "2")!, status: "Testing status")
    
    func userService(login: String) -> User? {
        if login == testUser.login {
            return testUser
        }
        return nil
    }
    
}
