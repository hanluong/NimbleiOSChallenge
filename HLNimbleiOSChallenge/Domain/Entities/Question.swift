//
//  Question.swift
//  HLNimbleiOSChallenge
//
//  Created by Han Luong on 23/10/2023.
//

import Foundation

struct Question: Codable {
    let id: String
    let answers: [Answer]
}
