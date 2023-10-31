//
//  LoginViewController.swift
//  HLNimbleiOSChallenge
//
//  Created by Han Luong on 20/10/2023.
//

import UIKit

class LoginViewController: UIViewController, StoryboardInstantiable, Alertable {
    
    // MARK: - Outlets
    
    lazy var forgotPasswordButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Forgot? ", for: .normal)
        button.tintColor = .lightGray
        return button
    }()
    
    @IBOutlet weak var emailTextField: CustomTextField!
    @IBOutlet weak var passwordTextField: CustomTextField!
    
    private var viewModel: LoginViewModel!
    
    // MARK: - Lifecycle
    
    static func create(with viewModel: LoginViewModel) -> LoginViewController {
        let view = LoginViewController.instantiateViewController()
        view.viewModel = viewModel
        return view
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hideKeyboardWhenTappedAround()
        setupViews()
        bind(to: viewModel)
    }
    
    // MARK: - Private
    
    private func setupViews() {
        navigationItem.setHidesBackButton(true, animated: true)
        navigationItem.backButtonTitle = ""
        passwordTextField.rightView = forgotPasswordButton
        passwordTextField.rightViewMode = .always
        forgotPasswordButton.addTarget(self, action: #selector(handleForgotPassword(sender:)), for: .touchUpInside)
    }
    
    private func bind(to viewModel: LoginViewModel) {
        viewModel.error.observe(on: self) { [weak self] in
            self?.showError($0.rawValue)
        }
    }
    
    @objc func handleForgotPassword(sender: UIButton) {
        let vc = ForgotPasswordViewController.create()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    private func showError(_ error: String) {
        guard !error.isEmpty else { return }
        showAlert(title: "ERROR!", message: error)
    }
    
    // MARK: - Actions
    
    @IBAction func logInButtonTapped(_ sender: CustomButton) {
        viewModel.didLogin(email: emailTextField.text, password: passwordTextField.text)
    }
}
