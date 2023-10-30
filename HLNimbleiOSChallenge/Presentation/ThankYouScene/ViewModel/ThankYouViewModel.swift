//
//  ThankYouViewModel.swift
//  HLNimbleiOSChallenge
//
//  Created by Han Luong on 30/10/2023.
//

import Foundation

struct ThankYouViewModelActions {
    let showHomeView: () -> Void
}

protocol ThankYouViewModelInput {
    func restartSurveys()
}

protocol ThankYouViewModelOutput {}

protocol ThankYouViewModel: ThankYouViewModelInput, ThankYouViewModelOutput { }

final class DefaultThankYouViewModel: ThankYouViewModel {
    
    private let actions: ThankYouViewModelActions?
    
    init(actions: ThankYouViewModelActions? = nil) {
        self.actions = actions
    }
}

extension DefaultThankYouViewModel {
    
    func restartSurveys() {
        actions?.showHomeView()
    }
}
