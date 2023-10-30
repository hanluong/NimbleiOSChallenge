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

}

extension RootSceneDIContainer: RootFlowCoordinatorDependencies {
    func makeThankYouViewController(actions: ThankYouViewModelActions) -> ThankYouViewController {
        return ThankYouViewController.create(with: makeThankYouViewModel(actions: actions))
    }
    
    func makeSurveyViewController(survey: Survey, actions: SurveyViewModelActions) -> SurveyViewController {
        return SurveyViewController.create(with: makeSurveyViewModel(survey: survey, actions: actions))
    }
    
    func makeLoginViewController(actions: LoginViewModelActions) -> LoginViewController {
        return LoginViewController.create(with: makeLoginViewModel(actions: actions))
    }
    
    func makeHomeViewController(actions: HomeViewModelActions) -> HomeViewController {
        return HomeViewController.create(with: makeHomeViewModel(actions: actions))
    }
    
    func makeRootViewController(actions: RootViewModelActions) -> RootViewController {
        return RootViewController.create(with: makeRootViewControllerViewModel(actions: actions))
    }
    
    private func makeRootViewControllerViewModel(actions: RootViewModelActions) -> RootViewModel {
        return DefaultRootViewModel(fetchRecentUserUseCases: makeFetchRecentUserUseCase, actions: actions)
    }
    
    private func makeLoginViewModel(actions: LoginViewModelActions) -> LoginViewModel {
        return DefaultLoginViewModel(loginUseCase: makeLoginUseCase(), actions: actions)
    }
    
    private func makeHomeViewModel(actions: HomeViewModelActions) -> HomeViewModel {
        return DefaultHomeViewModel(homeUseCase: makeHomeUseCase(), actions: actions)
    }
    
    private func makeSurveyViewModel(survey: Survey, actions: SurveyViewModelActions) -> SurveyViewModel {
        return DefaultSurveyViewModel(survey: survey, actions: actions)
    }
    
    private func makeThankYouViewModel(actions: ThankYouViewModelActions) -> ThankYouViewModel {
        return DefaultThankYouViewModel(actions: actions)
    }
    
    // MARK: - Use Cases
    private func makeFetchRecentUserUseCase(completion: @escaping (Result<User?, Error>) -> Void) -> UseCase {
        return FetchRecentUserUseCase(userRepository: makeUserRepository(), completion: completion)
    }
    
    private func makeLoginUseCase() -> LoginUseCase {
        return DefaultLoginUseCase(userRepository: makeUserRepository())
    }
    
    private func makeHomeUseCase() -> HomeUseCase {
        return DefaultHomeUseCase(surveyRepository: makeSurveyRepository())
    }
    
    // MARK: - Repository
    private func makeUserRepository() -> UserRepository {
        return DefaultUserRepository(dataTransferService: dependencies, userPersistentStorage: userStorage)
    }
    
    private func makeSurveyRepository() -> SurveyRepository {
        return DefaultSurveyRepository(dataTransferService: dependencies, userPersistentStorage: userStorage)
    }
    
}
