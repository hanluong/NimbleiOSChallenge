//
//  UseCase.swift
//  HLNimbleiOSChallenge
//
//  Created by Han Luong on 23/10/2023.
//

import Foundation

public protocol UseCase {
    @discardableResult
    func start() -> Cancellable?
}
