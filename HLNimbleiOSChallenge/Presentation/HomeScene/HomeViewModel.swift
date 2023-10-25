//
//  HomeViewModel.swift
//  HLNimbleiOSChallenge
//
//  Created by Han Luong on 25/10/2023.
//

import Foundation

struct HomeViewModelActions {
    let showSurveyView: (Survey) -> Void
}

protocol HomeViewModelInput {
    func viewWillAppear()
    func didStartSurvey(_ survey: Survey)
}

protocol HomeViewModelOutput {
    var surveyList: Observable<SurveyList?> { get }
}

protocol HomeViewModel: HomeViewModelInput, HomeViewModelOutput { }


final class DefaultHomeViewModel: HomeViewModel {
    
    private let homeUseCase: HomeUseCase
    private let actions: HomeViewModelActions?
    private var loadSurveyListTask: Cancellable? { willSet { loadSurveyListTask?.cancel() } }
    
    // MARK: - Output
    var surveyList: Observable<SurveyList?> = Observable(nil)
    
    init(homeUseCase: HomeUseCase, actions: HomeViewModelActions? = nil) {
        self.homeUseCase = homeUseCase
        self.actions = actions
    }
    
    private func loadAllSurveys() {
        LoadingView.show()
        loadSurveyListTask = homeUseCase.execute{ result in
            LoadingView.hide()
            switch result {
            case .success(let surveyList):
                self.surveyList.value = surveyList
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}

// MARK: - Input
extension DefaultHomeViewModel {
    
    func viewWillAppear() {
        loadAllSurveys()
    }
    
    func didStartSurvey(_ survey: Survey) {
        DispatchQueue.main.async {
            self.actions?.showSurveyView(survey)
        }
    }
}
