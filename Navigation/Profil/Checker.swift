//
//  Checker.swift
//  Navigation
//
//  Created by MacBook on 14.05.2023.
//

import Foundation

 final class Checker {
    
    static let shared = Checker()
    
    private init() {}
    
   private let login = "dibirova"
   private let password = "8888"
    
    func chek (login:String, password:String) -> Bool {
        if login == self.login && password == self.password {
            return true
        }else {
            return false
        }
    }
}
