//
//  ViewController.swift
//  Essential Developer Practice App
//
//  Created by Krishna Ramachandran on 2/16/22.
//

import UIKit

struct User {
    let name: String
}

class LoginViewController: UIViewController {
    var user: User?
    var api = ApiClient.shared
    
    func didTapLogin() {
        api.login { [weak self] user in
            self?.user = user
        }
    }
}
