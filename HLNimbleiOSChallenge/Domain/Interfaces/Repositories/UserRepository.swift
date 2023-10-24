//
//  UserRepository.swift
//  HLNimbleiOSChallenge
//
//  Created by Han Luong on 23/10/2023.
//

import Foundation

protocol UserRepository {
    @discardableResult
    func fetchRecentUser(completion: @escaping (Result<User?, Error>) -> Void) -> Cancellable?
    func saveRecentUser(user: User, completion: @escaping (Result<AuthenticationToken, Error>) -> Void)
    func login(email: String, password: String, completion: @escaping (Result<User, Error>) -> Void) -> Cancellable?
}
