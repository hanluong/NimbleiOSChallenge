//
//  AppConfiguratorTests.swift
//  HLNimbleiOSChallengeTests
//
//  Created by Han Luong on 25/10/2023.
//

import XCTest
@testable import HLNimbleiOSChallenge

class AppConfiguratorTests: XCTestCase {
    
    func test_existentConfigFile() throws {
        _ = try AppConfigurations()
    }
    
    func test_configurationValues() throws {
        let configuration = try AppConfigurations()
        
        // For URL - ROOT_URL = https://survey-api.nimblehq.co/
        XCTAssertFalse(configuration.rootUrl.isEmpty)
        XCTAssertEqual(configuration.rootUrl.count, 31)
        
        // For clientId - CLIENT_ID = ofzl-2h5ympKa0WqqTzqlVJUiRsxmXQmt5tkgrlWnOE
        XCTAssertFalse(configuration.clientId.isEmpty)
        XCTAssertEqual(configuration.clientId.count, 43)
        
        // For clientSecret - CLIENT_SECRET = lMQb900L-mTeU-FVTCwyhjsfBwRCxwwbCitPob96cuU
        XCTAssertFalse(configuration.clientSecret.isEmpty)
        XCTAssertEqual(configuration.clientSecret.count, 43)
  }
}
