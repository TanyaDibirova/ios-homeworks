//
//  FeedModel.swift
//  Navigation
//
//  Created by MacBook on 20.06.2023.
//

import Foundation

class FeedModel {
    var secretWord = "secret"
    
    func chek(word: String) -> Bool {
        if word == secretWord {
            return true
        }else {
            return false
        }
    }
}
