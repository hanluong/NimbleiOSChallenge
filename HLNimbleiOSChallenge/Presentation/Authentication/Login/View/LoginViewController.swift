//
//  LoginViewController.swift
//  HLNimbleiOSChallenge
//
//  Created by Han Luong on 20/10/2023.
//

import UIKit

class LoginViewController: UIViewController, StoryboardInstantiable {
    
    // MARK: - Outlets
    
    lazy var forgotPasswordButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Forgot? ", for: .normal)
        button.tintColor = .lightGray
        return button
    }()
    
    @IBOutlet weak var emailTextField: CustomTextField!
    @IBOutlet weak var passwordTextField: CustomTextField!
    
//    let viewModel = LoginViewModel(apiClient: APIClient(cachedData: CacheData()))
//    private var viewModel: MovieDetailsViewModel!
    
    // MARK: - Lifecycle
    
    static func create() -> LoginViewController {
        let view = LoginViewController.instantiateViewController()
//        view.viewModel = viewModel
        return view
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hideKeyboardWhenTappedAround()
        setupViews()
    }
    
    // MARK: - Private
    
    private func setupViews() {
        navigationItem.setHidesBackButton(true, animated: true)
        navigationItem.backButtonTitle = ""
        passwordTextField.rightView = forgotPasswordButton
        passwordTextField.rightViewMode = .always
        forgotPasswordButton.addTarget(self, action: #selector(handleForgotPassword(sender:)), for: .touchUpInside)
    }
    
    func openHomeView() {
//        let vc = SingleHomeComponentViewController()
//        vc.modalTransitionStyle = .crossDissolve
//        vc.modalPresentationStyle = .fullScreen
//        self.present(vc, animated: true)
    }
    
    @objc func handleForgotPassword(sender: UIButton) {
        let vc = ForgotPasswordViewController.create()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    // MARK: - Actions
    
    @IBAction func logInButtonTapped(_ sender: CustomButton) {
        print("logInButtonTapped")
//        if !emailField.text!.isEmpty && !passwordField.text!.isEmpty {
//            let progressBar = Loader(text: "Please Wait")
//            self.view.addSubview(progressBar)
//            viewModel.loginInUser(email: emailField.text!, password: passwordField.text!) {
//                DispatchQueue.main.async { [weak self] in
//                    guard let self = self else { return }
//                    if self.viewModel.loginSuccessful {
//                        self.openHomeView()
//                    }
//                }
//            } onFailure: { error in
//                DispatchQueue.main.async { [weak self] in
//                    guard let self = self else { return }
//                    self.showAlert("Error", error)
//                }
//            } loading: { loading in
//                DispatchQueue.main.async {
//                    if loading {
//                        progressBar.show()
//                    } else {
//                        progressBar.hide()
//                    }
//                }
//            }
//        } else {
//            showAlert("Login Error", "Enter Email and Password")
//        }
    }
}
