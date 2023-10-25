//
//  Survey.swift
//  HLNimbleiOSChallenge
//
//  Created by Han Luong on 23/10/2023.
//

import Foundation

struct SurveyList: Codable {
    let surveys: [Survey]
}
struct Survey: Codable {
    let id: String
    let title: String
    let description: String
    let imageUrl: String
}
