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
    var dateTimeString: Observable<String> { get }
}

protocol HomeViewModel: HomeViewModelInput, HomeViewModelOutput { }


final class DefaultHomeViewModel: HomeViewModel {
    
    private let homeUseCase: HomeUseCase
    private let actions: HomeViewModelActions?
    private var loadSurveyListTask: Cancellable? { willSet { loadSurveyListTask?.cancel() } }
    
    // MARK: - Output
    var surveyList: Observable<SurveyList?> = Observable(nil)
    var dateTimeString: Observable<String> = Observable("")
    
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
    
    private func getCurrentDate() {
        // get the current date and time
        let currentDateTime = Date()

        // initialize the date formatter and set the style
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE, MMM d"
        formatter.locale = Locale(identifier: "en_US_POSIX")

        // get the date time String from the date object
        dateTimeString.value = formatter.string(from: currentDateTime).uppercased()
    }
}

// MARK: - Input
extension DefaultHomeViewModel {
    
    func viewWillAppear() {
        loadAllSurveys()
        getCurrentDate()
    }
    
    func didStartSurvey(_ survey: Survey) {
        DispatchQueue.main.async {
            self.actions?.showSurveyView(survey)
        }
    }
}
