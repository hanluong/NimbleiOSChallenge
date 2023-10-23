//
//  RootViewController.swift
//  HLNimbleiOSChallenge
//
//  Created by Han Luong on 22/10/2023.
//

import UIKit

final class RootViewController: UIViewController, StoryboardInstantiable {

    // MARK: - Lifecycle

    private var viewModel: RootViewModel!
    
    static func create(with viewModel: RootViewModel = DefaultRootViewModel()) -> RootViewController {
        let view = RootViewController.instantiateViewController()
        view.viewModel = viewModel
        return view
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        bind(to: viewModel)
    }

    private func bind(to viewModel: RootViewModel) {
        viewModel.status.observe(on: self) { status in
            switch status {
            case .loading:
                LoadingView.show()
            case .cancelled, .finished:
                LoadingView.hide()
            }
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        viewModel.refreshAuthenticationToken()
    }

    // MARK: - Private

    private func setupViews() {
        LoadingView.show()
    }
}
