//
//  RootFlowCoordinator.swift
//  HLNimbleiOSChallenge
//
//  Created by Han Luong on 23/10/2023.
//

import UIKit

protocol RootFlowCoordinatorDependencies {
    func makeRootViewController(actions: RootViewModelActions) -> RootViewController
    func makeLoginViewController(actions: LoginViewModelActions) -> LoginViewController
    func makeHomeViewController(actions: HomeViewModelActions) -> HomeViewController
    func makeSurveyViewController(survey: Survey, actions: SurveyViewModelActions) -> SurveyViewController
    func makeThankYouViewController(actions: ThankYouViewModelActions) -> ThankYouViewController
}

final class RootFlowCoordinator {
    
    private weak var navigationController: UINavigationController?
    private let dependencies: RootFlowCoordinatorDependencies

    init(navigationController: UINavigationController,
         dependencies: RootFlowCoordinatorDependencies) {
        self.navigationController = navigationController
        self.dependencies = dependencies
    }
    
    func start() {
        let actions = RootViewModelActions(navigateToLoginSceneFlow: showLoginView, navigateToHomeSceneFlow: showHomeView)
        let vc = dependencies.makeRootViewController(actions: actions)
        navigationController?.pushViewController(vc, animated: false)
    }
    
    private func showLoginView() {
        let actions = LoginViewModelActions(showHomeView: showHomeView)
        let vc = dependencies.makeLoginViewController(actions: actions)
        navigationController?.pushViewController(vc, animated: true)
    }
    
    private func showHomeView() {
        let actions = HomeViewModelActions(showSurveyView: showSurveyView)
        let vc = dependencies.makeHomeViewController(actions: actions)
        navigationController?.pushViewController(vc, animated: true)
    }
    
    private func showSurveyView(_ survey: Survey) {
        let actions = SurveyViewModelActions(showThankYouView: showThankYouView)
        let vc = dependencies.makeSurveyViewController(survey: survey, actions: actions)
        navigationController?.pushViewController(vc, animated: true)
    }
    
    private func showThankYouView() {
        let actions = ThankYouViewModelActions(showHomeView: showHomeView)
        let vc = dependencies.makeThankYouViewController(actions: actions)
        navigationController?.pushViewController(vc, animated: true)
    }
}
