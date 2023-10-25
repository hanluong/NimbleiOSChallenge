//
//  UserDefaultsUserStorage.swift
//  HLNimbleiOSChallenge
//
//  Created by Han Luong on 24/10/2023.
//

import Foundation

final class UserDefaultsUserStorage {
    
    private let recentUserRefreshTokenKey = "recentUserRefreshToken"
    private let recentUserAccessTokenKey = "recentUserAccessToken"
    private var userDefaults: UserDefaults
    
    init(userDefaults: UserDefaults = UserDefaults.standard) {
        self.userDefaults = userDefaults
    }

    private func fetchUserRefreshToken() -> AuthenticationToken? {
        if let queriesData = userDefaults.object(forKey: recentUserRefreshTokenKey) as? Data {
            if let authenticationTokenUDS = try? JSONDecoder().decode(AuthenticationTokenUDS.self, from: queriesData) {
                return authenticationTokenUDS.toDomain()
            }
        }
        return nil
    }
    
    private func fetchUserAccessToken() -> AccessToken? {
        if let queriesData = userDefaults.object(forKey: recentUserAccessTokenKey) as? Data {
            if let accessTokenUDS = try? JSONDecoder().decode(AccessTokenUDS.self, from: queriesData) {
                return accessTokenUDS.toDomain()
            }
        }
        return nil
    }

    private func persist(user: User) {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(AuthenticationTokenUDS(token: user.refreshToken)) {
            userDefaults.set(encoded, forKey: recentUserRefreshTokenKey)
        }
        if let encoded = try? encoder.encode(AccessTokenUDS(token: user.accessToken)) {
            userDefaults.set(encoded, forKey: recentUserAccessTokenKey)
        }
    }
}

extension UserDefaultsUserStorage: UserStorage {
    
    func fetchRecentUserAccessToken(completion: @escaping (Result<AccessToken?, Error>) -> Void) {
        DispatchQueue.global(qos: .userInitiated).async { [weak self] in
            guard let self = self else { return }
            completion(.success(self.fetchUserAccessToken()))
        }
    }
    
    
    func fetchRecentUserRefreshToken(completion: @escaping (Result<AuthenticationToken?, Error>) -> Void) {
        DispatchQueue.global(qos: .userInitiated).async { [weak self] in
            guard let self = self else { return }
            completion(.success(self.fetchUserRefreshToken()))
        }
    }
    
    func saveRecentUser(user: User, completion: @escaping (Result<Bool, Error>) -> Void) {
        DispatchQueue.global(qos: .userInitiated).async { [weak self] in
            guard let self = self else { return }
            self.persist(user: user)
            completion(.success(true))
        }
    }
    
}

