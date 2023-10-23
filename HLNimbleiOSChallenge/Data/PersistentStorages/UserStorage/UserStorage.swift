//
//  UserStorage.swift
//  HLNimbleiOSChallenge
//
//  Created by Han Luong on 24/10/2023.
//

import Foundation

protocol UserStorage {
    func fetchRecentUser(completion: @escaping (Result<AuthenticationToken?, Error>) -> Void)
    func saveRecentUser(user: User, completion: @escaping (Result<AuthenticationToken, Error>) -> Void)
}

