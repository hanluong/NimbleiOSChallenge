//
//  AppFlowCoordinator.swift
//  HLNimbleiOSChallenge
//
//  Created by Han Luong on 21/10/2023.
//

import UIKit

final class AppFlowCoordinator {
    
    private let navigationController: UINavigationController
    private let appDIContainer: AppDIContainer
    
    init(navigationController: UINavigationController, appDIContainer: AppDIContainer) {
        self.navigationController = navigationController
        self.appDIContainer = appDIContainer
    }
    
    func start() {
        let authenticationSceneDIContainer = appDIContainer.makeAuthenticationSceneDIContainer()
        let flow = authenticationSceneDIContainer.makeAuthenticationFlowCoordinator(navigationController: navigationController)
        flow.start()
    }
}
