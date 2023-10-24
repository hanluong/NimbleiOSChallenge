//
//  RootViewModel.swift
//  HLNimbleiOSChallenge
//
//  Created by Han Luong on 22/10/2023.
//

import Foundation

struct RootViewModelActions {
    let navigateToLoginSceneFlow: () -> Void
    let navigateToHomeSceneFlow: () -> Void
}

enum DataReadyStatus {
    case loading
    case finished
    case cancelled
}

protocol RootViewModelInput {
    func viewWillAppear()
}

protocol RootViewModelOutput {
    var status: Observable<DataReadyStatus> { get }
}

protocol RootViewModel: RootViewModelInput, RootViewModelOutput { }

typealias FetchRecentUserUseCaseFactory = (@escaping (Result<AuthenticationToken?, Error>) -> Void) -> UseCase

final class DefaultRootViewModel: RootViewModel {
    
    private let fetchRecentUserUseCases: FetchRecentUserUseCaseFactory
    private let actions: RootViewModelActions?
    
    // MARK: - RootViewModelOutput
    
    var status: Observable<DataReadyStatus> = Observable(.loading)
    
    init(fetchRecentUserUseCases: @escaping FetchRecentUserUseCaseFactory, actions: RootViewModelActions? = nil) {
        self.fetchRecentUserUseCases = fetchRecentUserUseCases
        self.actions = actions
    }
    
    private func loadRecentUser() {
        let completion: (Result<AuthenticationToken?, Error>) -> Void = { result in
            switch result {
            case .success(let authToken):
                if authToken != nil {
                    DispatchQueue.main.async {
                        self.actions?.navigateToHomeSceneFlow()
                    }
                } else {
                    DispatchQueue.main.async {
                        // self.actions?.navigateToLoginSceneFlow()
                        self.actions?.navigateToHomeSceneFlow()
                    }
                }
                self.status.value = .finished
            case .failure:
                DispatchQueue.main.async {
                    self.actions?.navigateToLoginSceneFlow()
                }
                self.status.value = .cancelled
            }
        }
        let useCase = fetchRecentUserUseCases(completion)
        useCase.start()
    }
    
    // MARK: - RootViewModelInput
    
    func viewWillAppear() {
        loadRecentUser()
    }
}
