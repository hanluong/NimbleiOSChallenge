//
//  HomeViewController.swift
//  HLNimbleiOSChallenge
//
//  Created by Han Luong on 24/10/2023.
//

import UIKit

class HomeViewController: UIViewController, StoryboardInstantiable {

//    let viewModel = LoginViewModel(apiClient: APIClient(cachedData: CacheData()))
//    private var viewModel: MovieDetailsViewModel!
    
    // MARK: - Lifecycle
    
    static func create() -> HomeViewController {
        let view = HomeViewController.instantiateViewController()
//        view.viewModel = viewModel
        return view
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    private func setupViews() {
        navigationItem.setHidesBackButton(true, animated: true)
    }
}
