//
//  DefaultUserRepository.swift
//  HLNimbleiOSChallenge
//
//  Created by Han Luong on 23/10/2023.
//

import Foundation

final class DefaultUserRepository {

    private let dataTransferService: DataTransferService
    private var userPersistentStorage: UserStorage

    init(dataTransferService: DataTransferService, userPersistentStorage: UserStorage) {
        self.dataTransferService = dataTransferService
        self.userPersistentStorage = userPersistentStorage
    }
}

extension DefaultUserRepository: UserRepository {
    
    func fetchRecentUser(completion: @escaping (Result<AuthenticationToken?, Error>) -> Void) {
        userPersistentStorage.fetchRecentUser(completion: completion)
    }
    
    func saveRecentUser(user: User, completion: @escaping (Result<AuthenticationToken, Error>) -> Void) {
        userPersistentStorage.saveRecentUser(user: user, completion: completion)
    }
    
    func login(email: String, password: String, completion: @escaping (Result<User, Error>) -> Void) -> Cancellable? {
        let requestDTO = UserRequestDTO(email: email, password: password)
        let task = RepositoryTask()
        guard !task.isCancelled else { return nil }
        let endpoint = APIEndpoints.signIn(with: requestDTO)
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

