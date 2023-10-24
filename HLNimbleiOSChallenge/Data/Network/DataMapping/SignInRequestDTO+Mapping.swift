//
//  SignInRequestDTO+Mapping.swift
//  HLNimbleiOSChallenge
//
//  Created by Han Luong on 24/10/2023.
//

import Foundation

struct SignInRequestDTO: Encodable {
    let grantType = "password"
    let email: String
    let password: String
    
    private enum CodingKeys: String, CodingKey {
        case email, password
        case grantType = "grant_type"
    }
}
