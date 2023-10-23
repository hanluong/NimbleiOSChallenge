//
//  RepositoryTask.swift
//  HLNimbleiOSChallenge
//
//  Created by Han Luong on 23/10/2023.
//

import Foundation

class RepositoryTask: Cancellable {
    var networkTask: NetworkCancellable?
    var isCancelled: Bool = false
    
    func cancel() {
        networkTask?.cancel()
        isCancelled = true
    }
}
