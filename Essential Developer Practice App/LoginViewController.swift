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
    var login: (((User) -> Void) -> Void)?
    var user: User?
    
    func didTapLogin() {
        guard let login = login else {
            user = nil
            return
        }
        login { [weak self] user in
            self?.user = user
        }
    }
}
