//
//  HomeSceneDIContainer.swift
//  HLNimbleiOSChallenge
//
//  Created by Han Luong on 22/10/2023.
//

import UIKit

final class HomeSceneDIContainer: HomeFlowCoordinatorDependencies {
    
    private let dependencies: DataTransferService
    
    init(dependencies: DataTransferService) {
        self.dependencies = dependencies
    }
    
    // MARK: - Flow Coordinators
    func makeHomeFlowCoordinator(navigationController: UINavigationController) -> HomeFlowCoordinator {
        return HomeFlowCoordinator(navigationController: navigationController,
                                           dependencies: self)
    }
    
    // MARK: - Login View
//    func makeHomeViewController() -> UIViewController {
//        return HomeViewController.create()
//    }
}
