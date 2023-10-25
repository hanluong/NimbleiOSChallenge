//
//  NetworkSessionManagerMock.swift
//  HLNimbleiOSChallengeTests
//
//  Created by Han Luong on 25/10/2023.
//

import Foundation
@testable import HLNimbleiOSChallenge

struct NetworkSessionManagerMock: NetworkSessionManager {
    let response: HTTPURLResponse?
    let data: Data?
    let error: Error?
    
    func request(_ request: URLRequest,
                 completion: @escaping CompletionHandler) -> NetworkCancellable {
        completion(data, response, error)
        return URLSessionDataTask()
    }
}
