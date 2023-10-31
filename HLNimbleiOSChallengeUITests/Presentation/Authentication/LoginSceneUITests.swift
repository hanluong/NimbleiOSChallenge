//
//  LoginSceneUITests.swift
//  HLNimbleiOSChallengeUITests
//
//  Created by Han Luong on 31/10/2023.
//

import XCTest

final class LoginSceneUITests: XCTestCase {

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    func testOpenLoginView() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()
        
        // given
        let emailTextField = app.textFields[AuthenticationIdentifier.emailTextField]
        let forgotPasswordButton = app.buttons[AuthenticationIdentifier.forgotPasswordButton]
        let loginButton = app.buttons[AuthenticationIdentifier.loginButton]
        let logoImageView = app.images[AuthenticationIdentifier.logoImageView]
        
        // then
        XCTAssertTrue(emailTextField.exists)
        XCTAssertTrue(forgotPasswordButton.exists)
        XCTAssertTrue(loginButton.exists)
        XCTAssertTrue(logoImageView.exists)
    }
}
