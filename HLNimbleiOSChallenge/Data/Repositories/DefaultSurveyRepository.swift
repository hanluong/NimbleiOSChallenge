//
//  DefaultSurveyRepository.swift
//  HLNimbleiOSChallenge
//
//  Created by Han Luong on 25/10/2023.
//

import Foundation

final class DefaultSurveyRepository {

    private let dataTransferService: DataTransferService
    private var userPersistentStorage: UserStorage

    init(dataTransferService: DataTransferService, userPersistentStorage: UserStorage) {
        self.dataTransferService = dataTransferService
        self.userPersistentStorage = userPersistentStorage
    }
}

extension DefaultSurveyRepository: SurveyRepository {
    
    func fetchSurveysList(completion: @escaping (Result<SurveyList, Error>) -> Void) -> Cancellable? {
        let task = RepositoryTask()
        guard !task.isCancelled else { return nil }
        userPersistentStorage.fetchRecentUserAccessToken { accessTokenResult in
            if case .success(let accessToken) = accessTokenResult, let authToken = accessToken {
                let endpoint = APIEndpoints.getAllSurveys(with: authToken.token)
                task.networkTask = self.dataTransferService.request(with: endpoint) { result in
                    switch result {
                    case .success(let responseDTO):
                        completion(.success(responseDTO.toDomain()))
                    case .failure(let error):
                        completion(.failure(error))
                    }
                }
            }
        }
        
        return task
    }
    
}

