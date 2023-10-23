//
//  RootViewModel.swift
//  HLNimbleiOSChallenge
//
//  Created by Han Luong on 22/10/2023.
//

import Foundation

//struct RootViewModelDependencies {
//  let authorizationService: AuthorizationServiceProtocol
//  let userInteractorUseCases: UserUseCasesProtocol
//  let navigateToSignInSceneFlow: Any
//  let navigateToSignUpSceneFlow: Any
//  let navigateToMainSceneFlow: Any
//}

enum DataReadyStatus {
  case loading
  case finished
  case cancelled
}

protocol RootViewModelInput {
    func refreshAuthenticationToken()
}

protocol RootViewModelOutput {
    var status: Observable<DataReadyStatus> { get }
}

protocol RootViewModel: RootViewModelInput, RootViewModelOutput { }

final class DefaultRootViewModel: RootViewModel {
    var status: Observable<DataReadyStatus> = Observable(.loading)
//    private let dependencies: RootViewModelDependencies
}

extension DefaultRootViewModel {
    func refreshAuthenticationToken() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) { [weak self] in
            self?.status.value = .finished
        }
    }
}
