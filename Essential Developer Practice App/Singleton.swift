//
//  Singleton.swift
//  Essential Developer Practice App
//
//  Created by Krishna Ramachandran on 2/16/22.
//

import Foundation

// Singleton ApiClient

class ApiClient {
    static let shared = ApiClient()
    
    private init() {}
}

// App Target extension for login closure
extension ApiClient {
    func login(completion: (User) -> Void) {
        completion(User(name: "Bob"))
    }
}
