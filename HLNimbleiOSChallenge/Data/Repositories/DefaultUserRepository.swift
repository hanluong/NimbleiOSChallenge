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
}

//extension DefaultUserRepository: UserRepository {
//
//    func refreshCurrentUser(token: String,
//                     cached: @escaping (User) -> Void,
//                     completion: @escaping (Result<User, Error>) -> Void) -> Cancellable? {
//        let requestDTO = UserRequestDTO(id: "", token: token)
//        let task = RepositoryTask()
//
//        cache.getResponse(for: requestDTO) { result in
//
//            if case let .success(responseDTO?) = result {
//                cached(responseDTO.toDomain())
//            }
//            guard !task.isCancelled else { return }
//
//            let endpoint = APIEndpoints.refreshUserToken(with: requestDTO)
//            task.networkTask = self.dataTransferService.request(with: endpoint) { result in
//                switch result {
//                case .success(let responseDTO):
//                    self.cache.save(response: responseDTO, for: requestDTO)
//                    completion(.success(responseDTO.toDomain()))
//                case .failure(let error):
//                    completion(.failure(error))
//                }
//            }
//        }
//        return task
//    }
//}

