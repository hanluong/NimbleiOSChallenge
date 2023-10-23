//
//  AppDIContainer.swift
//  HLNimbleiOSChallenge
//
//  Created by Han Luong on 21/10/2023.
//

import Foundation

final class AppDIContainer {
    
    lazy var appConfiguration = AppConfigurations()
    
    // MARK: - Network
    lazy var apiDataTransferService: DataTransferService = {
        let config = ApiDataNetworkConfig(baseURL: URL(string: appConfiguration.rootUrl)!,
                                          queryParameters: ["client_id": appConfiguration.clientId,
                                                            "client_secret": appConfiguration.clientSecret])
        
        let apiDataNetwork = DefaultNetworkService(config: config)
        return DefaultDataTransferService(with: apiDataNetwork)
    }()
    
    // MARK: - DIContainers of scenes
    func makeRootSceneDIContainer() -> RootSceneDIContainer {
        return RootSceneDIContainer(dependencies: apiDataTransferService)
    }
}
