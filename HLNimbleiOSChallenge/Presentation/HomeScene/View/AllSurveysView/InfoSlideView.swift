//
//  InfoSlideView.swift
//  HLNimbleiOSChallenge
//
//  Created by Han Luong on 25/10/2023.
//

import UIKit
import SDWebImage

protocol InfoSlideViewDelegate {
    func didTappOnStartSurvey(_ survey: Survey)
}

class InfoSlideView: UIView {
    
    private var survey: Survey!
    var delegate: InfoSlideViewDelegate?
    
    // MARK: - IBOutlets
    @IBOutlet weak var bgImageView: UIImageView!
    @IBOutlet weak var titleInfoLabel: UILabel!
    @IBOutlet weak var descInfoLabel: UILabel!
    
    func setupViews(with survey: Survey) {
        self.survey = survey
        titleInfoLabel.text = survey.title
        descInfoLabel.text = survey.description
        bgImageView.sd_setImage(with: URL(string: survey.imageUrl), placeholderImage: UIImage(named: "bg_lazy_load"))
    }
    
    @IBAction func startSurveyButtonTapped(_ sender: Any) {
        delegate?.didTappOnStartSurvey(survey)
    }
}
