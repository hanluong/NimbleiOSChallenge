//
//  HomeUseCase.swift
//  HLNimbleiOSChallenge
//
//  Created by Han Luong on 25/10/2023.
//

import Foundation

protocol HomeUseCase {
    func execute(completion: @escaping (Result<SurveyList, Error>) -> Void) -> Cancellable?
}

final class DefaultHomeUseCase: HomeUseCase {
    
    private let surveyRepository: SurveyRepository

    init(surveyRepository: SurveyRepository) {
        self.surveyRepository = surveyRepository
    }

    func execute(completion: @escaping (Result<SurveyList, Error>) -> Void) -> Cancellable? {
        return surveyRepository.fetchSurveysList(completion: completion)
    }
}


