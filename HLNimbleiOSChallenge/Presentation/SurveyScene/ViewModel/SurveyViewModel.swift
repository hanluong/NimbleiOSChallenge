//
//  SurveyViewModel.swift
//  HLNimbleiOSChallenge
//
//  Created by Han Luong on 25/10/2023.
//

import Foundation

struct SurveyViewModel: Equatable {
    let title: String
    let description: String
}


extension SurveyViewModel {
    
    init(survey: Survey) {
        self.title = survey.title
        self.description = survey.description
    }
}
