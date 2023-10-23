//
//  UserRepository.swift
//  HLNimbleiOSChallenge
//
//  Created by Han Luong on 23/10/2023.
//

import Foundation

protocol UserRepository {
    func fetchRecentUser(completion: @escaping (Result<AuthenticationToken?, Error>) -> Void)
    func saveRecentUser(user: User, completion: @escaping (Result<AuthenticationToken, Error>) -> Void)
}
