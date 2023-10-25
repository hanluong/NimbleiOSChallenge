//
//  HomeUseCase.swift
//  HLNimbleiOSChallenge
//
//  Created by Han Luong on 25/10/2023.
//

import Foundation

protocol HomeUseCase {
    func execute(user: User, completion: @escaping (Result<SurveyList, Error>) -> Void) -> Cancellable?
}

final class DefaultHomeUseCase: HomeUseCase {
    
    private let surveyRepository: SurveyRepository

    init(surveyRepository: SurveyRepository) {
        self.surveyRepository = surveyRepository
    }

    func execute(user: User, completion: @escaping (Result<SurveyList, Error>) -> Void) -> Cancellable? {
        return surveyRepository.fetchSurveysList(user: user, completion: completion)
    }
}


