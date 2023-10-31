//
//  AppFlowCoordinator.swift
//  HLNimbleiOSChallenge
//
//  Created by Han Luong on 21/10/2023.
//

import UIKit

protocol AppFlowCoordinatorDependencies {
    func makeLoginViewController(actions: LoginViewModelActions) -> LoginViewController
    func makeHomeViewController(actions: HomeViewModelActions) -> HomeViewController
    func makeSurveyViewController(survey: Survey, actions: SurveyViewModelActions) -> SurveyViewController
    func makeThankYouViewController(actions: ThankYouViewModelActions) -> ThankYouViewController
}

final class AppFlowCoordinator {
    
    private let appDIContainer = AppDIContainer()
    private let navigationController = UINavigationController(rootViewController: RootViewController.create())
    private var window : UIWindow?
    
    init(window: UIWindow?) {
        self.window = window
        if (self.window?.windowScene?.activationState == .unattached) {
            self.window?.rootViewController = navigationController
            self.window?.makeKeyAndVisible()
        }
    }
    
    func start() {
        appDIContainer.makeUserRepository().fetchRecentUser { [weak self] result in
            switch result {
            case .success(let user):
                if user != nil {
                    DispatchQueue.main.async {
                        self?.showHomeView()
                    }
                } else {
                    DispatchQueue.main.async {
                        self?.showLoginView()
                    }
                }
            case .failure:
                DispatchQueue.main.async {
                    self?.showLoginView()
                }
            }
        }
    }
    
    private func showLoginView() {
        let actions = LoginViewModelActions(showHomeView: showHomeView)
        let vc = appDIContainer.makeLoginViewController(actions: actions)
        navigationController.pushViewController(vc, animated: true)
    }
    
    private func showHomeView() {
        let actions = HomeViewModelActions(showSurveyView: showSurveyView)
        let vc = appDIContainer.makeHomeViewController(actions: actions)
        navigationController.pushViewController(vc, animated: true)
    }
    
    private func showSurveyView(_ survey: Survey) {
        let actions = SurveyViewModelActions(showThankYouView: showThankYouView)
        let vc = appDIContainer.makeSurveyViewController(survey: survey, actions: actions)
        navigationController.pushViewController(vc, animated: true)
    }
    
    private func showThankYouView() {
        let actions = ThankYouViewModelActions(showHomeView: showHomeView)
        let vc = appDIContainer.makeThankYouViewController(actions: actions)
        navigationController.pushViewController(vc, animated: true)
    }
}
