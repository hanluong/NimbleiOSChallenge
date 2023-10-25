//
//  InfoSlideView.swift
//  HLNimbleiOSChallenge
//
//  Created by Han Luong on 25/10/2023.
//

import UIKit
import SDWebImage

protocol InfoSlideViewDelegate {
    func didTappOnStartSurvey(_ vm: InfoSlideViewModel)
}

class InfoSlideView: UIView {
    
    private var viewModel: InfoSlideViewModel!
    var delegate: InfoSlideViewDelegate?
    
    // MARK: - IBOutlets
    @IBOutlet weak var bgImageView: UIImageView!
    @IBOutlet weak var titleInfoLabel: UILabel!
    @IBOutlet weak var descInfoLabel: UILabel!
    
    func setupViews(with viewModel: InfoSlideViewModel) {
        self.viewModel = viewModel
        titleInfoLabel.text = viewModel.title
        descInfoLabel.text = viewModel.description
        bgImageView.sd_setImage(with: URL(string: viewModel.imageUrl), placeholderImage: UIImage(named: "bg_lazy_load"))
    }
    
    @IBAction func startSurveyButtonTapped(_ sender: Any) {
        delegate?.didTappOnStartSurvey(viewModel)
    }
}


struct InfoSlideViewModel {
    let title: String
    let description: String
    let imageUrl: String
}
