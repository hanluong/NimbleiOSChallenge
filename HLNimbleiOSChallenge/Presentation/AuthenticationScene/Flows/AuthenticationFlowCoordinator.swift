//
//  AuthenticationFlowCoordinator.swift
//  HLNimbleiOSChallenge
//
//  Created by Han Luong on 21/10/2023.
//

import UIKit

protocol AuthenticationFlowCoordinatorDependencies {
    func makeLoginViewController() -> UIViewController
}


final class AuthenticationFlowCoordinator {
    private weak var navigationController: UINavigationController?
    private let dependencies: AuthenticationFlowCoordinatorDependencies
    
    init(navigationController: UINavigationController,
         dependencies: AuthenticationFlowCoordinatorDependencies) {
        self.navigationController = navigationController
        self.dependencies = dependencies
    }
    
    func start() {
        let vc = dependencies.makeLoginViewController()
        navigationController?.pushViewController(vc, animated: false)
    }
}
