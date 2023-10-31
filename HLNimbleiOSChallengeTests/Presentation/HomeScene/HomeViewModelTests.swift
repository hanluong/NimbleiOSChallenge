//
//  HomeViewModelTests.swift
//  HLNimbleiOSChallengeTests
//
//  Created by Han Luong on 25/10/2023.
//

import XCTest
@testable import HLNimbleiOSChallenge

class HomeViewModelTests: XCTestCase {
    
    private enum HomeUseCaseError: Error {
        case errorFetchingSurvey
    }
    
    var sampleSurveys = [
        Survey(id: "1", title: "title-1", description: "description-1", imageUrl: "http://image-1.png"),
        Survey(id: "2", title: "title-2", description: "description-2", imageUrl: "http://image-2.png"),
        Survey(id: "3", title: "title-3", description: "description-3", imageUrl: "http://image-3.png"),
        Survey(id: "4", title: "title-4", description: "description-4", imageUrl: "http://image-4.png"),
        Survey(id: "5", title: "title-5", description: "description-5", imageUrl: "http://image-5.png")
    ]
    
    private class HomeUseCaseMock: HomeUseCase {
        
        var expectation: XCTestExpectation?
        var error: Error?
        var surveyList: SurveyList = SurveyList(surveys: [])
        var completion: ((Result<SurveyList, Error>) -> Void) = {_ in }
        
        func execute(completion: @escaping (Result<SurveyList, Error>) -> Void) -> Cancellable? {
            if let error = error {
                completion(.failure(error))
            } else {
                completion(.success(surveyList))
            }
            expectation?.fulfill()
            return nil
        }
    }
    
    private func getCurrentDate() -> String {
        // get the current date and time
        let currentDateTime = Date()

        // initialize the date formatter and set the style
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE, MMM d"
        formatter.locale = Locale(identifier: "en_US_POSIX")

        return formatter.string(from: currentDateTime).uppercased()
    }
    
    func test_whenHomeUseCaseFetchingSurveysReturnSurveyList() throws {
        // given
        let homeUseCaseMock = HomeUseCaseMock()
        homeUseCaseMock.expectation = self.expectation(description: "Fetch surveys")
        homeUseCaseMock.surveyList = SurveyList(surveys: sampleSurveys)
        let viewModel = DefaultHomeViewModel(homeUseCase: homeUseCaseMock)
        
        // when
        viewModel.viewWillAppear()
        
        // then
        waitForExpectations(timeout: 5, handler: nil)
        XCTAssertEqual(viewModel.surveyList.value?.surveys.count, sampleSurveys.count)
    }
    
    func test_whenHomeUseCaseFetchingSurveysReturnError() throws {
        // given
        let homeUseCaseMock = HomeUseCaseMock()
        homeUseCaseMock.expectation = self.expectation(description: "Fetch surveys")
        homeUseCaseMock.error = HomeUseCaseError.errorFetchingSurvey
        let viewModel = DefaultHomeViewModel(homeUseCase: homeUseCaseMock)
        
        // when
        viewModel.viewWillAppear()
        
        // then
        waitForExpectations(timeout: 5, handler: nil)
        XCTAssertNil(viewModel.surveyList.value)
    }
    
    func test_whenHomeUseCaseGetCurrentDate() throws {
        // given
        let homeUseCaseMock = HomeUseCaseMock()
        homeUseCaseMock.expectation = self.expectation(description: "Fetch surveys")
        homeUseCaseMock.surveyList = SurveyList(surveys: sampleSurveys)
        let viewModel = DefaultHomeViewModel(homeUseCase: homeUseCaseMock)
        
        // when
        viewModel.viewWillAppear()
        
        // then
        waitForExpectations(timeout: 5, handler: nil)
        XCTAssertEqual(viewModel.dateTimeString.value, getCurrentDate())
    }
    
}
