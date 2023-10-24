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
    func makeHomeViewController() -> HomeViewController
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
        let vc = dependencies.makeHomeViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
}
