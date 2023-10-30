//
//  ThankYouViewController.swift
//  HLNimbleiOSChallenge
//
//  Created by Han Luong on 24/10/2023.
//

import UIKit

class ThankYouViewController: UIViewController, StoryboardInstantiable {
    
    // Variables
    private var viewModel: ThankYouViewModel!

    static func create(with viewModel: ThankYouViewModel) -> ThankYouViewController {
        let view = ThankYouViewController.instantiateViewController()
        view.viewModel = viewModel
        return view
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationItem.setHidesBackButton(true, animated: true)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) { [weak self] in
            self?.viewModel.restartSurveys()
        }
    }
}
