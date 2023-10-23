//
//  UserResponseDTO+Mapping.swift
//  HLNimbleiOSChallenge
//
//  Created by Han Luong on 23/10/2023.
//

import Foundation

// MARK: - Data Transfer Object

struct UserResponseDTO: Decodable {
    let data: UserData
}

extension UserResponseDTO {
    struct UserData: Decodable {
        let id: String
        let type: String
        let attributes: Attributes
    }
}

extension UserResponseDTO {
    struct Attributes: Decodable {
        let accessToken, tokenType: String
        let expiresIn: Int
        let refreshToken: String
        let createdAt: Int

        private enum CodingKeys: String, CodingKey {
            case accessToken = "access_token"
            case tokenType = "token_type"
            case expiresIn = "expires_in"
            case refreshToken = "refresh_token"
            case createdAt = "created_at"
        }
    }
}

// MARK: - Mappings to Domain

extension UserResponseDTO {
    func toDomain() -> User {
        return .init(id: data.id, token: data.attributes.refreshToken)
    }
}

