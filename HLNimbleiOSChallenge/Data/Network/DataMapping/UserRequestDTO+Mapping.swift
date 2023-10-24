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
    let grantType = "refresh_token"
    let token: String
    
    private enum CodingKeys: String, CodingKey {
        case token = "refresh_token"
        case grantType = "grant_type"
    }
}

//responseData: ["data": {
//    attributes =     {
//        "access_token" = "JQa_v9AhMPQvDPe7VQhnY2wxzJkiv4viL0fOVrcX0F8";
//        "created_at" = 1698166701;
//        "expires_in" = 7200;
//        "refresh_token" = "wHfrNobtvPW4gyN-OJLCcAHJ1PXGDr9T6bcwQ6dd_mM";
//        "token_type" = Bearer;
//    };
//    id = 7169;
//    type = token;
//}]
