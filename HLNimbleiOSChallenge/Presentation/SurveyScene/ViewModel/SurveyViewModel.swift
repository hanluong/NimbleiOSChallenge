//
//  SurveyViewModel.swift
//  HLNimbleiOSChallenge
//
//  Created by Han Luong on 25/10/2023.
//

import Foundation

struct SurveyViewModelActions {
    let showThankYouView: () -> Void
}

protocol SurveyViewModelInput {
    func didFinishedSurvey()
}

protocol SurveyViewModelOutput {
    var title: String { get }
    var description: String { get }
}

protocol SurveyViewModel: SurveyViewModelInput, SurveyViewModelOutput { }

final class DefaultSurveyViewModel: SurveyViewModel {
    
    private let actions: SurveyViewModelActions?
    
    // MARK: - Output
    let title: String
    let description: String
    
    init(survey: Survey, actions: SurveyViewModelActions? = nil) {
        self.title = survey.title
        self.description = survey.description
        self.actions = actions
    }
}

extension DefaultSurveyViewModel {
    
    func didFinishedSurvey() {
        actions?.showThankYouView()
    }
}
