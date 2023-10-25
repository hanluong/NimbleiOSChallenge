//
//  HomeViewController.swift
//  HLNimbleiOSChallenge
//
//  Created by Han Luong on 24/10/2023.
//

import UIKit

class HomeViewController: UIViewController, StoryboardInstantiable {
    
    // MARK: - IBOutlets
    @IBOutlet weak var fullDateLabel: UILabel!
    @IBOutlet weak var userInfoStackView: UIStackView!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var contentScrollView: UIScrollView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    // Variables
    private var viewModel: HomeViewModel!
    
    // MARK: - Lifecycle
    
    static func create(with viewModel: HomeViewModel) -> HomeViewController {
        let view = HomeViewController.instantiateViewController()
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
    
    private func setupViews() {
        navigationItem.setHidesBackButton(true, animated: true)
    }
    
    private func bind(to viewModel: HomeViewModel) {
        viewModel.surveyList.observe(on: self) { [weak self] surveyListResult in
            guard let surveyList = surveyListResult else { return }
            guard let surveySlides = self?.createSurveySlide(surveyList: surveyList) else { return }
            self?.setupSurveyScrollViews(slides: surveySlides)
        }
    }
    
    private func createSurveySlide(surveyList: SurveyList) -> [InfoSlideView]? {
        var slides = [InfoSlideView]()
        for survey in surveyList.surveys {
            guard let slide = Bundle.main.loadNibNamed("InfoSlideView", owner: self, options: nil)?.first as? InfoSlideView else { return nil }
            slide.titleInfoLabel.text = survey.title
            slide.descInfoLabel.text = survey.description
            slides.append(slide)
        }
        return slides
    }
    
    private func setupSurveyScrollViews(slides: [InfoSlideView]) {
        view.bringSubviewToFront(fullDateLabel)
        view.bringSubviewToFront(userInfoStackView)
        view.bringSubviewToFront(pageControl)
        
        pageControl.numberOfPages = slides.count
        pageControl.currentPage = 0
        pageControl.currentPageIndicatorTintColor = UIColor.white
        
        contentScrollView.delegate = self
        contentScrollView.isPagingEnabled = true
        contentScrollView.showsVerticalScrollIndicator = false
        contentScrollView.showsHorizontalScrollIndicator = false
        contentScrollView.contentInsetAdjustmentBehavior = .never
        
        contentScrollView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
        for index in 0 ..< slides.count {
            slides[index].frame = CGRect(x: view.frame.width * CGFloat(index), y: 0, width: view.frame.width, height: view.frame.height)
            contentScrollView.addSubview(slides[index])
        }
        contentScrollView.contentSize = CGSize(width: view.frame.width * CGFloat(slides.count), height: view.frame.height)
    }
}

// MARK: - UIScrollViewDelegate
extension HomeViewController: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {}
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let pageIndex = Int(round(scrollView.contentOffset.x / view.frame.width))
        pageControl.currentPage = pageIndex
        pageControl.currentPageIndicatorTintColor = UIColor.white
    }
}
