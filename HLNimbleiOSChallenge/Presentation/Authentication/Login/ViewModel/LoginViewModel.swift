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
    func didLogin(email: String?, password: String?)
}

protocol LoginViewModelOutput {
    var error: Observable<String> { get }
}

protocol LoginViewModel: LoginViewModelInput, LoginViewModelOutput { }


final class DefaultLoginViewModel: LoginViewModel {
    
    private let loginUseCase: LoginUseCase
    private let actions: LoginViewModelActions?
    private var userLoginTask: Cancellable? { willSet { userLoginTask?.cancel() } }
    
    // MARK: - Output
    var error: Observable<String> = Observable("")
    
    init(loginUseCase: LoginUseCase, actions: LoginViewModelActions? = nil) {
        self.loginUseCase = loginUseCase
        self.actions = actions
    }
}

extension DefaultLoginViewModel {
    
    func didLogin(email: String?, password: String?) {
        guard let email = email, email.isValidEmail() else {
            error.value = "Email is empty or invalid. Please enter a valid email address."
            return
        }
        guard let password = password, !password.isEmpty else {
            error.value = "Password is empty. Please enter your password."
            return
        }
        
        LoadingView.show()
        userLoginTask = loginUseCase.execute(requestValue: .init(email: email, password: password), completion: { result in
            LoadingView.hide()
            switch result {
            case .success(let user):
                print(user)
                self.actions?.showHomeView()
            default:
                self.error.value = "Your email or password is incorrect. Please try again."
            }
            self.userLoginTask = nil
        })
    }
}
