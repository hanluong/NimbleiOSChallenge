//
//  LoginModel.swift
//  HLNimbleiOSChallenge
//
//  Created by Han Luong on 23/10/2023.
//

import Foundation

struct LoginResponse: Codable {
    let data: LoginDataClass
}

// MARK: - DataClass
struct LoginDataClass: Codable {
    let id: Int
    let type: String
    let attributes: Attributes
}

// MARK: - Attributes
struct Attributes: Codable {
    let accessToken, tokenType: String
    let expiresIn: Int
    let refreshToken: String
    let createdAt: Int

    enum CodingKeys: String, CodingKey {
        case accessToken = "access_token"
        case tokenType = "token_type"
        case expiresIn = "expires_in"
        case refreshToken = "refresh_token"
        case createdAt = "created_at"
    }
}

struct LogOutResponse: Codable {
}

struct ResetPasswordResponse: Codable {
    let meta: Meta
}

// MARK: - Meta
struct Meta: Codable {
    let message: String
}

