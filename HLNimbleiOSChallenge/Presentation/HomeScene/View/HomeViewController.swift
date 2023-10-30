//
//  HomeViewController.swift
//  HLNimbleiOSChallenge
//
//  Created by Han Luong on 24/10/2023.
//

import UIKit

class HomeViewController: UIViewController, StoryboardInstantiable {
    
    // MARK: - IBOutlets
    @IBOutlet weak var bgImageView: UIImageView!
    @IBOutlet weak var fullDateLabel: UILabel!
    @IBOutlet weak var userInfoStackView: UIStackView!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var contentScrollView: UIScrollView!
    @IBOutlet weak var pageControl: MyCustomPageControl!
    
    // Variables
    private var viewModel: HomeViewModel!
    private var slides = [InfoSlideView]()
    
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
        navigationItem.backButtonTitle = ""
        bgImageView.isHidden = false
    }
    
    private func bind(to viewModel: HomeViewModel) {
        viewModel.surveyList.observe(on: self) { [weak self] surveyListResult in
            guard let surveyList = surveyListResult else { return }
            guard let surveySlides = self?.createSurveySlide(surveyList: surveyList) else { return }
            self?.bgImageView.isHidden = true
            self?.setupSurveyScrollViews(slides: surveySlides)
        }
        viewModel.dateTimeString.observe(on: self) { [weak self] dateTimeValue in
            self?.fullDateLabel.text = dateTimeValue
        }
    }
    
    private func createSurveySlide(surveyList: SurveyList) -> [InfoSlideView]? {
        slides.removeAll()
        for survey in surveyList.surveys {
            guard let slide = Bundle.main.loadNibNamed("InfoSlideView", owner: self, options: nil)?.first as? InfoSlideView else { return nil }
            slide.setupViews(with: survey)
            slide.delegate = self
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
        if #available(iOS 14.0, *) {
          pageControl.backgroundStyle = .minimal
          pageControl.allowsContinuousInteraction = false
        }
        pageControl.addTarget(self, action: #selector(pageControlTapped(sender:)), for: .valueChanged)
        
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
    
    @objc func pageControlTapped(sender: MyCustomPageControl) {
        contentScrollView.contentOffset = CGPoint(x: view.frame.width * CGFloat(sender.currentPage), y: 0)
    }
}

// MARK: - UIScrollViewDelegate
extension HomeViewController: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let pageIndex = Int(round(scrollView.contentOffset.x / view.frame.width))
        pageControl.currentPage = pageIndex
    }
    
}

// MARK: - InfoSlideViewDelegate
extension HomeViewController: InfoSlideViewDelegate {
    
    func didTappOnStartSurvey(_ survey: Survey) {
        viewModel.didStartSurvey(survey)
    }
    
}
