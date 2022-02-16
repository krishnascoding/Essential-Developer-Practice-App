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
    // Tests with singleton MockApiClient
    func test_loginViewController_user_updated_with_mockApiClient_singleton_instance() {
        let sut = LoginViewController()
        let client = MockApiClient()
        
        sut.api = client
        sut.didTapLogin()
        XCTAssertEqual(sut.user?.name, "Mock")
        
        client.user = User(name: "Bill")
        sut.didTapLogin()
        XCTAssertEqual(sut.user?.name, "Bill")
    }

    func test_loginViewController_user_updated_with_api_client_extension() {
        let sut = LoginViewController()
        let client = MockApiClient()
        sut.api = client

        XCTAssertNil(sut.user)
        client.user = User(name: "Bill")
        sut.didTapLogin()
        XCTAssertEqual(sut.user?.name, "Bill")
    }
    
    // Helpers
    private func createUserFunction(with name: String) -> (((User) -> Void) -> Void) {
        let user = User(name: name)
        return { completion in
            completion(user)
        }
    }
}

class MockApiClient: ApiClient {
    var user = User(name: "Mock")
    override func login(completion: (User) -> Void) {
        completion(user)
    }
}
