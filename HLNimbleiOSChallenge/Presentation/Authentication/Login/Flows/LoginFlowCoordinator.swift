//
//  LoginFlowCoordinator.swift
//  HLNimbleiOSChallenge
//
//  Created by Han Luong on 21/10/2023.
//

import UIKit

protocol LoginFlowCoordinatorDependencies {
    func makeLoginViewController() -> UIViewController
}


final class LoginFlowCoordinator {
    private weak var navigationController: UINavigationController?
    private let dependencies: LoginFlowCoordinatorDependencies
    
    init(navigationController: UINavigationController,
         dependencies: LoginFlowCoordinatorDependencies) {
        self.navigationController = navigationController
        self.dependencies = dependencies
    }
    
    func start() {
        let vc = dependencies.makeLoginViewController()
        navigationController?.pushViewController(vc, animated: false)
    }
}
