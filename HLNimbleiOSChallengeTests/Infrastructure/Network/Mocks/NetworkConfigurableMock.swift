//
//  NetworkConfigurableMock.swift
//  HLNimbleiOSChallengeTests
//
//  Created by Han Luong on 25/10/2023.
//

import Foundation
@testable import HLNimbleiOSChallenge

class NetworkConfigurableMock: NetworkConfigurable {
    var baseURL: URL = URL(string: "https://mock.test.com")!
    var headers: [String: String] = [:]
    var queryParameters: [String: String] = [:]
}
