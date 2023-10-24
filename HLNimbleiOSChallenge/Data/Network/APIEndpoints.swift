//
//  APIEndpoints.swift
//  HLNimbleiOSChallenge
//
//  Created by Han Luong on 23/10/2023.
//

import Foundation

struct APIEndpoints {
    
    // MARK: - Authentication
    
    static func signIn(with userRequestDTO: UserRequestDTO) -> Endpoint<UserResponseDTO> {
        return Endpoint(path: "/api/v1/oauth/token",
                        method: .post,
                        queryParametersEncodable: userRequestDTO,
                        queryParameters: ["grant_type":"password"])
        
    }
    
    static func signOut(token: String) -> Endpoint<Data> {
        return Endpoint(path: "/api/v1/oauth/revoke",
                        method: .post,
                        queryParameters: ["token": token,
                                          "client_id": "ofzl-2h5ympKa0WqqTzqlVJUiRsxmXQmt5tkgrlWnOE",
                                          "client_secret": "lMQb900L-mTeU-FVTCwyhjsfBwRCxwwbCitPob96cuU"])
    }
    
    static func refreshUserToken(with authenticationTokenRequestDTO: AuthenticationTokenRequestDTO) -> Endpoint<UserResponseDTO> {
        return Endpoint(path: "/api/v1/oauth/token",
                        method: .post,
                        queryParametersEncodable: authenticationTokenRequestDTO)
    }
    
    static func resetPassword(email: String) -> Endpoint<Data> {
        return Endpoint(path: "/api/v1/passwords",
                        method: .post,
                        queryParameters: ["user": ["email": email],
                                          "client_id": "ofzl-2h5ympKa0WqqTzqlVJUiRsxmXQmt5tkgrlWnOE",
                                          "client_secret": "lMQb900L-mTeU-FVTCwyhjsfBwRCxwwbCitPob96cuU"])
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

