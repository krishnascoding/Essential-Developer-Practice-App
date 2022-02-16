//
//  LoginViewControllerTests.swift
//  LoginViewControllerTests
//
//  Created by Krishna Ramachandran on 2/16/22.
//

import XCTest
@testable import Essential_Developer_Practice_App

class LoginViewControllerTests: XCTestCase {

    // Dependency Inversion using closure Tests
    func test_loginViewController_user_updated_with_dependency_inversion_closure() {
        let sut = LoginViewController()
        
        // Uses extension in test target, if extension does not exist, uses the one from app target
        sut.login = ApiClient.shared.login
        sut.didTapLogin()
        XCTAssertEqual(sut.user?.name, "Test")
        
        sut.login = nil
        sut.didTapLogin()
        XCTAssertNil(sut.user)
        
        sut.login = createUser(with: "Bill")
        sut.didTapLogin()
        XCTAssertEqual(sut.user?.name, "Bill")

    }
    
    // Dependency Inversion using closure Tests
    func test_loginViewController_user_updated_with_api_client_extension() {
        let sut = LoginViewController()
        
        XCTAssertNil(sut.user)
        // Uses extension in test target, if extension does not exist, uses the one from app target
        sut.login = ApiClient.shared.login
        sut.didTapLogin()
        XCTAssertEqual(sut.user?.name, "Test")
    }
    
    // Helpers
    private func createUser(with name: String) -> (((User) -> Void) -> Void) {
        let user = User(name: name)
        return { completion in
            completion(user)
        }
    }
}

private extension ApiClient {
    func login(completion: (User) -> Void) {
        completion(User(name: "Test"))
    }
}
