//
//  Survey.swift
//  HLNimbleiOSChallenge
//
//  Created by Han Luong on 23/10/2023.
//

import Foundation

struct Survey: Codable {
    let id: String
    let questions: [Question]

    enum CodingKeys: String, CodingKey {
        case id = "survey_id"
        case questions
    }
}
