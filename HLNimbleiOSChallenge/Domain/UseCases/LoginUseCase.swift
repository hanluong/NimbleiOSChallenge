//
//  LoginUseCase.swift
//  HLNimbleiOSChallenge
//
//  Created by Han Luong on 24/10/2023.
//

import Foundation

protocol LoginUseCase {
    func execute(requestValue: LoginUseCaseRequestValue,
                 completion: @escaping (Result<User, Error>) -> Void) -> Cancellable?
}

final class DefaultLoginUseCase: LoginUseCase {
    
    private let userRepository: UserRepository

    init(userRepository: UserRepository) {
        self.userRepository = userRepository
    }

    func execute(requestValue: LoginUseCaseRequestValue,
                 completion: @escaping (Result<User, Error>) -> Void) -> Cancellable? {
        return userRepository.login(email: requestValue.email,
                                    password: requestValue.password) { result in
            switch result {
            case .success(let user):
                self.userRepository.saveRecentUser(user: user) { _ in }
            default:
                print("FAIILED to login")
            }
            completion(result)
        }
    }
}

struct LoginUseCaseRequestValue {
    let email: String
    let password: String
}
