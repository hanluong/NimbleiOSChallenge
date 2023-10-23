//
//  HomeFlowCoordinator.swift
//  HLNimbleiOSChallenge
//
//  Created by Han Luong on 22/10/2023.
//

import UIKit

protocol HomeFlowCoordinatorDependencies {
//    func makeLoginViewController() -> UIViewController
}


final class HomeFlowCoordinator {
    private weak var navigationController: UINavigationController?
    private let dependencies: HomeFlowCoordinatorDependencies
    
    init(navigationController: UINavigationController,
         dependencies: HomeFlowCoordinatorDependencies) {
        self.navigationController = navigationController
        self.dependencies = dependencies
    }
    
    func start() {
//        let vc = dependencies.makeLoginViewController()
//        navigationController?.pushViewController(vc, animated: false)
    }
}

