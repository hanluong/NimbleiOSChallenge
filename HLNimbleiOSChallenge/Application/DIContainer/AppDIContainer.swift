//
//  AppDIContainer.swift
//  HLNimbleiOSChallenge
//
//  Created by Han Luong on 21/10/2023.
//

import Foundation

final class AppDIContainer {
    
    // MARK: - Configuration
    lazy var appConfiguration = AppConfigurations()
    
    // MARK: - Persistent Storage
    lazy var userStorage: UserStorage = UserDefaultsUserStorage()
    lazy var userResponseCache: UserResponseStorage = CoreDataUserResponseStorage()
    
    // MARK: - Network
    lazy var apiDataTransferService: DataTransferService = {
        let config = ApiDataNetworkConfig(baseURL: URL(string: appConfiguration.rootUrl)!,
                                          queryParameters: ["client_id": appConfiguration.clientId,
                                                            "client_secret": appConfiguration.clientSecret])
        
        let apiDataNetwork = DefaultNetworkService(config: config)
        return DefaultDataTransferService(with: apiDataNetwork)
    }()
}

extension AppDIContainer: AppFlowCoordinatorDependencies {
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
    
    private func makeSurveyRepository() -> SurveyRepository {
        return DefaultSurveyRepository(dataTransferService: apiDataTransferService, userPersistentStorage: userStorage)
    }
    
    func makeUserRepository() -> UserRepository {
        return DefaultUserRepository(dataTransferService: apiDataTransferService, userPersistentStorage: userStorage)
    }
    
}

