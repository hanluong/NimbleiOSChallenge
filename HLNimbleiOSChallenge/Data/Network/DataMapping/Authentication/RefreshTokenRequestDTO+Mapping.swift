//
//  RefreshTokenRequestDTO+Mapping.swift
//  HLNimbleiOSChallenge
//
//  Created by Han Luong on 23/10/2023.
//

import Foundation

struct RefreshTokenRequestDTO: Encodable {
    let grantType = "refresh_token"
    let token: String
    
    private enum CodingKeys: String, CodingKey {
        case token = "refresh_token"
        case grantType = "grant_type"
    }
}
