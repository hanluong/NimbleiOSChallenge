//
//  AuthenticationSceneDIContainer.swift
//  HLNimbleiOSChallenge
//
//  Created by Han Luong on 21/10/2023.
//

import UIKit

final class AuthenticationSceneDIContainer: AuthenticationFlowCoordinatorDependencies {
    
    struct Dependencies {
        let apiDataTransferService: DataTransferService
    }
    
    private let dependencies: Dependencies
    
    init(dependencies: Dependencies) {
        self.dependencies = dependencies
    }
    
    // MARK: - Flow Coordinators
    func makeAuthenticationFlowCoordinator(navigationController: UINavigationController) -> AuthenticationFlowCoordinator {
        return AuthenticationFlowCoordinator(navigationController: navigationController,
                                           dependencies: self)
    }
    
    // MARK: - Login View
    func makeLoginViewController() -> UIViewController {
        return LoginViewController.create()
    }
}
