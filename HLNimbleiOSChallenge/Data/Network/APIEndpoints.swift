//
//  APIEndpoints.swift
//  HLNimbleiOSChallenge
//
//  Created by Han Luong on 23/10/2023.
//

import Foundation

struct APIEndpoints {
    
    // MARK: - Authentication
    
    static func signIn(with signInRequestDTO: SignInRequestDTO) -> Endpoint<UserResponseDTO> {
        return Endpoint(path: "api/v1/oauth/token",
                        method: .post,
                        queryParametersEncodable: signInRequestDTO)
    }
    
    static func refreshUserToken(with authenticationTokenRequestDTO: RefreshTokenRequestDTO) -> Endpoint<UserResponseDTO> {
        return Endpoint(path: "api/v1/oauth/token",
                        method: .post,
                        queryParametersEncodable: authenticationTokenRequestDTO)
    }
    
    // MARK: - Home
    
    static func getAllSurveys(with accessToken: String) -> Endpoint<SurveyDataResponseDTO> {
        return Endpoint(path: "/api/v1/surveys",
                        method: .get,
                        headerParamaters: ["Authorization": "Bearer \(accessToken)"])
    }
}

