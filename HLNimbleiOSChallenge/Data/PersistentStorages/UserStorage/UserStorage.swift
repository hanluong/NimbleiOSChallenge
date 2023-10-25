//
//  UserStorage.swift
//  HLNimbleiOSChallenge
//
//  Created by Han Luong on 24/10/2023.
//

import Foundation

protocol UserStorage {
    func fetchRecentUserRefreshToken(completion: @escaping (Result<AuthenticationToken?, Error>) -> Void)
    func fetchRecentUserAccessToken(completion: @escaping (Result<AccessToken?, Error>) -> Void)
    func saveRecentUser(user: User, completion: @escaping (Result<Bool, Error>) -> Void)
}

