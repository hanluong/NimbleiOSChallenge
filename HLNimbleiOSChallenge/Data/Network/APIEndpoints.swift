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
    
    static func refreshUserToken(with authenticationTokenRequestDTO: AuthenticationTokenRequestDTO) -> Endpoint<UserResponseDTO> {
        return Endpoint(path: "/api/v1/oauth/token",
                        method: .post,
                        queryParametersEncodable: authenticationTokenRequestDTO)
    }
    
    // MARK: - Home
    
    static func getUserData() -> Endpoint<Data> {
        return Endpoint(path: "/api/v1/me", method: .get)
    }
    
    static func getAllSurveys() -> Endpoint<Data> {
        return Endpoint(path: "/api/v1/surveys", method: .get)
    }
    
    static func getSingleSurvey(id: String) -> Endpoint<Data> {
        return Endpoint(path: "/api/v1/surveys",
                        method: .get,
                        queryParametersEncodable: id)
    }
}

