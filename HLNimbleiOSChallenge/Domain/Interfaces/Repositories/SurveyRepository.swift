//
//  SurveyRepository.swift
//  HLNimbleiOSChallenge
//
//  Created by Han Luong on 25/10/2023.
//

import Foundation

protocol SurveyRepository {
    func fetchSurveysList(user: User, completion: @escaping (Result<SurveyList, Error>) -> Void) -> Cancellable?
}
