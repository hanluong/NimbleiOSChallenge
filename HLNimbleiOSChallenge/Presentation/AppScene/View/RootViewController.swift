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
    
    static func create(with viewModel: RootViewModel) -> RootViewController {
        let view = RootViewController.instantiateViewController()
        view.viewModel = viewModel
        return view
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        bind(to: viewModel)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        viewModel.viewWillAppear()
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

    // MARK: - Private

    private func setupViews() {
        LoadingView.show()
    }
}
