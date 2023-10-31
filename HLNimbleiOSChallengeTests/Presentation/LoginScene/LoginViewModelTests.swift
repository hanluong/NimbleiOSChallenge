//
//  LoginViewModelTests.swift
//  HLNimbleiOSChallengeTests
//
//  Created by Han Luong on 25/10/2023.
//

import XCTest
@testable import HLNimbleiOSChallenge

class LoginViewModelTests: XCTestCase {
    
    private enum LoginUserUseCase: Error {
        case errorLoginIncorrectUser
    }
    
    private class LoginUseCaseMock: LoginUseCase {
        
        var expectation: XCTestExpectation?
        var error: Error?
        var completion: ((Result<User?, Error>) -> Void) = {_ in }

        func execute(requestValue: LoginUseCaseRequestValue, completion: @escaping (Result<User, Error>) -> Void) -> Cancellable? {
            if let error = error {
                completion(.failure(error))
            } else {
                let sampleUser = User(id: "123", accessToken: "abc-123", refreshToken: "aaa-123")
                completion(.success(sampleUser))
            }
            expectation?.fulfill()
            return nil
        }
        
    }
    
    func test_whenLoginWith_emptyEmail() throws {
        // given
        let loginUseCaseMock = LoginUseCaseMock()
        let viewModel = DefaultLoginViewModel(loginUseCase: loginUseCaseMock)
        
        // when
        viewModel.didLogin(email: "", password: "12345678")
        
        // then
        XCTAssertEqual(viewModel.error.value, LoginError.emailInvalid)
    }
    
    func test_whenLoginWith_invalidEmail() throws {
        // given
        let loginUseCaseMock = LoginUseCaseMock()
        let viewModel = DefaultLoginViewModel(loginUseCase: loginUseCaseMock)
        
        // when
        viewModel.didLogin(email: "han@", password: "12345678")
        
        // then
        XCTAssertEqual(viewModel.error.value, LoginError.emailInvalid)
    }
    
    func test_whenLoginWith_emptyPassword() throws {
        // given
        let loginUseCaseMock = LoginUseCaseMock()
        let viewModel = DefaultLoginViewModel(loginUseCase: loginUseCaseMock)
        
        // when
        viewModel.didLogin(email: "hanluong@nimblehq.co", password: "")
        
        // then
        XCTAssertEqual(viewModel.error.value, LoginError.passwordEmpty)
    }
    
    func test_whenLoginWith_incorrectEmailPassword() throws {
        // given
        let loginUseCaseMock = LoginUseCaseMock()
        loginUseCaseMock.expectation = self.expectation(description: "Login valid user")
        loginUseCaseMock.error = LoginUserUseCase.errorLoginIncorrectUser
        let viewModel = DefaultLoginViewModel(loginUseCase: loginUseCaseMock)
        
        // when
        viewModel.didLogin(email: "hanluong@nimblehq.co", password: "incorrect_password")
        
        // then
        waitForExpectations(timeout: 5, handler: nil)
        XCTAssertEqual(viewModel.error.value, LoginError.incorrectEmailPassword)
    }
    
    func test_whenLoginWith_validEmailAndPassword() throws {
        // given
        let loginUseCaseMock = LoginUseCaseMock()
        loginUseCaseMock.expectation = self.expectation(description: "Login valid user")
        let viewModel = DefaultLoginViewModel(loginUseCase: loginUseCaseMock)
        
        // when
        viewModel.didLogin(email: "hanluong@nimblehq.co", password: "12345678")
        
        // then
        waitForExpectations(timeout: 5, handler: nil)
        XCTAssertEqual(viewModel.error.value, LoginError.none)
    }
    
}
