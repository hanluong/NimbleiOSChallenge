//
//  User.swift
//  HLNimbleiOSChallenge
//
//  Created by Han Luong on 23/10/2023.
//

import Foundation

struct User: Equatable, Identifiable {
    let id: String
    let accessToken: String
    let refreshToken: String
}

struct AuthenticationToken: Equatable {
    let token: String
}

