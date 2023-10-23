//
//  LoginSceneDIContainer.swift
//  HLNimbleiOSChallenge
//
//  Created by Han Luong on 21/10/2023.
//

import UIKit

final class LoginSceneDIContainer: LoginFlowCoordinatorDependencies {
    
    private let dependencies: DataTransferService
    
    init(dependencies: DataTransferService) {
        self.dependencies = dependencies
    }
    
    // MARK: - Flow Coordinators
    func makeLoginFlowCoordinator(navigationController: UINavigationController) -> LoginFlowCoordinator {
        return LoginFlowCoordinator(navigationController: navigationController,
                                           dependencies: self)
    }
    
    // MARK: - Login View
    func makeLoginViewController() -> UIViewController {
        return LoginViewController.create()
    }
}
