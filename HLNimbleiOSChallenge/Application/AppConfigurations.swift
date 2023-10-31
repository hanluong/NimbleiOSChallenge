//
//  AppConfigurations.swift
//  HLNimbleiOSChallenge
//
//  Created by Han Luong on 20/10/2023.
//

import Foundation

final class AppConfigurations {
    lazy var rootUrl: String = {
        guard let url = Bundle.main.object(forInfoDictionaryKey: "BASE_URL") as? String else {
            fatalError("BASE_URL must not be empty in plist")
        }
        return url.replacingOccurrences(of: "\\", with: "")
    }()
    
    lazy var clientId: String = {
        guard let id = Bundle.main.object(forInfoDictionaryKey: "NIMBLE_CLIENT_ID") as? String else {
            fatalError("NIMBLE_CLIENT_ID must not be empty in plist")
        }
        return id
    }()
    
    lazy var clientSecret: String = {
        guard let secretKey = Bundle.main.object(forInfoDictionaryKey: "NIMBLE_CLIENT_SECRET") as? String else {
            fatalError("NIMBLE_CLIENT_SECRET must not be empty in plist")
        }
        return secretKey
    }()
}
