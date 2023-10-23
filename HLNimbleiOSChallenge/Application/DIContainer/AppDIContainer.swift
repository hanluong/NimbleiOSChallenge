//
//  AppDIContainer.swift
//  HLNimbleiOSChallenge
//
//  Created by Han Luong on 21/10/2023.
//

import Foundation

final class AppDIContainer {
    
//    lazy var appConfiguration = AppConfigurations()
//    
//    // MARK: - Network
//    lazy var apiDataTransferService: DataTransferService = {
//        let config = ApiDataNetworkConfig(baseURL: URL(string: appConfiguration.rootUrl)!,
//                                          queryParameters: ["api_key": appConfiguration.clientId,
//                                                            "language": NSLocale.preferredLanguages.first ?? "en"])
//        
//        let apiDataNetwork = DefaultNetworkService(config: config)
//        return DefaultDataTransferService(with: apiDataNetwork)
//    }()
//    
//    // MARK: - DIContainers of scenes
//    
//    func makeAuthenticationSceneDIContainer() -> AuthenticationSceneDIContainer {
//        let dependencies = AuthenticationSceneDIContainer.Dependencies(apiDataTransferService: apiDataTransferService)
//        return AuthenticationSceneDIContainer(dependencies: dependencies)
//    }
//    
//    func makeHomeSceneDIContainer() -> HomeSceneDIContainer {
//        let dependencies = AuthenticationSceneDIContainer.Dependencies(apiDataTransferService: apiDataTransferService)
//        return AuthenticationSceneDIContainer(dependencies: dependencies)
//    }
}
