//
//  FetchRecentUserUseCase.swift
//  HLNimbleiOSChallenge
//
//  Created by Han Luong on 23/10/2023.
//

import Foundation

final class FetchRecentUserUseCase: UseCase {
    
    private let userRepository: UserRepository
    private let completionResult: (Result<AuthenticationToken?, Error>) -> Void

    init(userRepository: UserRepository, completion: @escaping (Result<AuthenticationToken?, Error>) -> Void) {
        self.userRepository = userRepository
        self.completionResult = completion
    }
    
    func start() -> Cancellable? {
        userRepository.fetchRecentUser(completion: completionResult)
        return nil
    }
    
}

