//
//  LoginViewControllerDelegate.swift
//  Navigation
//
//  Created by MacBook on 15.05.2023.
//

import Foundation

protocol LoginViewControllerDelegate  {
    func check (login:String, password:String) -> Bool
}

struct LoginInspector: LoginViewControllerDelegate {
    func check(login: String, password: String) -> Bool {
        if Checker.shared.chek(login: login, password: password) == true {
            return true
        } else {
            return false
        }
    }
}


protocol LoginFactory {
    func makeLoginInspector() -> LoginInspector
}

struct MyLoginFactory: LoginFactory {
    func makeLoginInspector() -> LoginInspector {
        return LoginInspector()
    }
}
