//
//  UserDefaultsUserStorage.swift
//  HLNimbleiOSChallenge
//
//  Created by Han Luong on 24/10/2023.
//

import Foundation

final class UserDefaultsUserStorage {
    
    private let recentUserTokenKey = "recentUserToken"
    private var userDefaults: UserDefaults
    
    init(userDefaults: UserDefaults = UserDefaults.standard) {
        self.userDefaults = userDefaults
    }

    private func fetchUser() -> AuthenticationToken? {
        if let queriesData = userDefaults.object(forKey: recentUserTokenKey) as? Data {
            if let authenticationTokenUDS = try? JSONDecoder().decode(AuthenticationTokenUDS.self, from: queriesData) {
                return authenticationTokenUDS.toDomain()
            }
        }
        return nil
    }

    private func persist(token: String) {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(AuthenticationTokenUDS(token: token)) {
            userDefaults.set(encoded, forKey: recentUserTokenKey)
        }
    }
}

extension UserDefaultsUserStorage: UserStorage {
    
    func fetchRecentUser(completion: @escaping (Result<AuthenticationToken?, Error>) -> Void) {
        DispatchQueue.global(qos: .userInitiated).async { [weak self] in
            guard let self = self else { return }
            completion(.success(self.fetchUser()))
        }
    }
    
    func saveRecentUser(user: User, completion: @escaping (Result<AuthenticationToken, Error>) -> Void) {
        DispatchQueue.global(qos: .userInitiated).async { [weak self] in
            guard let self = self else { return }
            self.persist(token: user.refreshToken)
            completion(.success(AuthenticationToken(token: user.refreshToken)))
        }
    }
    
}

