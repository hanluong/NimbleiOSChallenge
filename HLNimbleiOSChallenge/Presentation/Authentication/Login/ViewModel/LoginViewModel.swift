//
//  LoginViewModel.swift
//  HLNimbleiOSChallenge
//
//  Created by Han Luong on 24/10/2023.
//

import Foundation

struct LoginViewModelActions {
    let showHomeView: () -> Void
}

protocol LoginViewModelInput {
    func didLogin(email: String, password: String)
}

protocol LoginViewModelOutput {
}

protocol LoginViewModel: LoginViewModelInput, LoginViewModelOutput { }


final class DefaultLoginViewModel: LoginViewModel {
    
    private let loginUseCase: LoginUseCase
    private let actions: LoginViewModelActions?
    private var userLoginTask: Cancellable? { willSet { userLoginTask?.cancel() } }
    
    init(loginUseCase: LoginUseCase, actions: LoginViewModelActions? = nil) {
        self.loginUseCase = loginUseCase
        self.actions = actions
    }
}

extension DefaultLoginViewModel {
    
    func didLogin(email: String, password: String) {
        userLoginTask = loginUseCase.execute(requestValue: .init(email: email, password: password), completion: { result in
            switch result {
            case .success(let user):
                print(user)
                self.actions?.showHomeView()
            default:
                print("FAILED login")
            }
        })
    }
}
