//
//  RootSceneDIContainer.swift
//  HLNimbleiOSChallenge
//
//  Created by Han Luong on 23/10/2023.
//

import UIKit

final class RootSceneDIContainer {
    
    private let dependencies: DataTransferService
    
    // MARK: - Persistent Storage
    lazy var userStorage: UserStorage = UserDefaultsUserStorage()
    lazy var userResponseCache: UserResponseStorage = CoreDataUserResponseStorage()
    
    init(dependencies: DataTransferService) {
        self.dependencies = dependencies
    }
    
    // MARK: - Flow Coordinators
    func makeRootFlowCoordinator(navigationController: UINavigationController) -> RootFlowCoordinator {
        return RootFlowCoordinator(navigationController: navigationController, dependencies: self)
    }
    
    // MARK: - DIContainers of scenes
    
    func makeLoginSceneDIContainer() -> LoginSceneDIContainer {
        return LoginSceneDIContainer(dependencies: dependencies)
    }
    
    func makeHomeSceneDIContainer() -> HomeSceneDIContainer {
        return HomeSceneDIContainer(dependencies: dependencies)
    }
}

extension RootSceneDIContainer: RootFlowCoordinatorDependencies {
    
    // MARK: - Root View
    func makeRootViewController() -> UIViewController {
        return RootViewController.create(with: makeRootViewControllerViewModel())
    }
    
    private func makeRootViewControllerViewModel() -> RootViewModel {
        return DefaultRootViewModel(fetchRecentUserUseCases: makeFetchRecentUserUseCase)
    }
    
    // MARK: - Use Cases
    private func makeFetchRecentUserUseCase(completion: @escaping (Result<AuthenticationToken?, Error>) -> Void) -> UseCase {
        return FetchRecentUserUseCase(userRepository: makeUserRepository(), completion: completion)
    }
    
    // MARK: - Repository
    private func makeUserRepository() -> UserRepository {
        return DefaultUserRepository(dataTransferService: dependencies, userPersistentStorage: userStorage)
    }
    
}
