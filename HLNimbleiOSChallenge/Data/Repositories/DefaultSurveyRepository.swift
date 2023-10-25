//
//  DefaultSurveyRepository.swift
//  HLNimbleiOSChallenge
//
//  Created by Han Luong on 25/10/2023.
//

import Foundation

final class DefaultSurveyRepository {

    private let dataTransferService: DataTransferService

    init(dataTransferService: DataTransferService) {
        self.dataTransferService = dataTransferService
    }
}

extension DefaultSurveyRepository: SurveyRepository {
    
    func fetchSurveysList(user: User, completion: @escaping (Result<SurveyList, Error>) -> Void) -> Cancellable? {
        let task = RepositoryTask()
        guard !task.isCancelled else { return nil }
        let endpoint = APIEndpoints.getAllSurveys(with: user.accessToken)
        task.networkTask = self.dataTransferService.request(with: endpoint) { result in
            switch result {
            case .success(let responseDTO):
                completion(.success(responseDTO.toDomain()))
            case .failure(let error):
                completion(.failure(error))
            }
        }
        
        return task
    }
    
}

