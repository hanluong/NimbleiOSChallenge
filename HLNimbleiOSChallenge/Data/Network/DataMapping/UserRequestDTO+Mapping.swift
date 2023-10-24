//
//  UserRequestDTO+Mapping.swift
//  HLNimbleiOSChallenge
//
//  Created by Han Luong on 23/10/2023.
//

import Foundation

struct UserRequestDTO: Encodable {
    let email: String
    let password: String
}

struct AuthenticationTokenRequestDTO: Encodable {
    let token: String
}

