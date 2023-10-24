//
//  ForgotPasswordViewController.swift
//  Nimble-iOS-Challenge
//
//  Created by Anthony Odu on 2/23/22.
//

import UIKit

class ForgotPasswordViewController: UIViewController, StoryboardInstantiable {
    
    @IBOutlet weak var emailField: CustomTextField!
    
//    let viewModel = LoginViewModel(apiClient: APIClient(cachedData: CacheData()))
    
    // MARK: - Lifecycle
    
    static func create() -> ForgotPasswordViewController {
        let view = ForgotPasswordViewController.instantiateViewController()
//        view.viewModel = viewModel
        return view
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hideKeyboardWhenTappedAround()
    }
    
    @IBAction func resetButton(_ sender: CustomButton) {
        print("resetButton")
//        if !emailField.text!.isEmpty {
//            let progressBar = Loader(text: "Please Wait")
//            self.view.addSubview(progressBar)
//            viewModel.resetPassword(email: emailField.text!) { value in
//                DispatchQueue.main.async { [weak self] in
//                    guard let self = self else { return }
//                    if self.viewModel.passwordResetSuccess {
//                        self.dismisView()
//                    } else {
//                        self.showAlert("", value)
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
//            showAlert("", "Enter Email")
//        }
    }
}
