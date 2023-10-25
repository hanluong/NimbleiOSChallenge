//
//  UserUDS+Mapping.swift
//  HLNimbleiOSChallenge
//
//  Created by Han Luong on 24/10/2023.
//

import Foundation

struct AuthenticationTokenUDS: Codable {
    let token: String
}

extension AuthenticationTokenUDS {
    func toDomain() -> AuthenticationToken {
        return .init(token: token)
    }
}
