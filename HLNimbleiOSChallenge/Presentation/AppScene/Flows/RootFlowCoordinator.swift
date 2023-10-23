//
//  RootFlowCoordinator.swift
//  HLNimbleiOSChallenge
//
//  Created by Han Luong on 23/10/2023.
//

import UIKit

protocol RootFlowCoordinatorDependencies {
    func makeRootViewController() -> UIViewController
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
//        let vc = dependencies.makeRootViewController()
        let vc = LoginViewController.create()
        navigationController?.pushViewController(vc, animated: false)
    }
}
