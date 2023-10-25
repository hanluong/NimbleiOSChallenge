//
//  SurveyViewController.swift
//  HLNimbleiOSChallenge
//
//  Created by Han Luong on 24/10/2023.
//

import UIKit

class SurveyViewController: UIViewController, StoryboardInstantiable {
    
    // MARK: - IBOutlets
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    // MARK: - Lifecycle

    private var viewModel: SurveyViewModel!
    
    static func create(with viewModel: SurveyViewModel) -> SurveyViewController {
        let view = SurveyViewController.instantiateViewController()
        view.viewModel = viewModel
        return view
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }

    @IBAction func startSurveyButtonTapped(_ sender: Any) {
        let vc = ThankYouViewController.create()
        vc.modalTransitionStyle = .crossDissolve
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true)
    }
    
    // MARK: - Private

    private func setupViews() {
        titleLabel.text = viewModel.title
        descriptionLabel.text = viewModel.description
    }

}
