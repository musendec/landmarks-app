//
//  LandmarksUITests.swift
//  LandmarksUITests
//
//  Created by Musé C on 10/4/26.
//  Copyright © 2026 Apple. All rights reserved.
//

import XCTest

final class LandmarksUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    @MainActor
    func testExample() throws {
        let app = XCUIApplication()
        app.activate()
        app/*@START_MENU_TOKEN@*/.buttons["categoryHome_profileButton"]/*[[".navigationBars",".buttons",".buttons[\"User Profile\"]",".buttons[\"categoryHome_profileButton\"]"],[[[-1,3],[-1,2],[-1,0,1]],[[-1,3],[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/.firstMatch.tap()
        app/*@START_MENU_TOKEN@*/.buttons["categoryHome_profileSheet"]/*[[".otherElements",".buttons[\"Edit\"]",".buttons[\"categoryHome_profileSheet\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/.firstMatch.tap()
        app.cells/*@START_MENU_TOKEN@*/.containing(.staticText, identifier: "Username").firstMatch/*[[".element(boundBy: 0)",".containing(.textField, identifier: \"profileEditor_usernameField\").firstMatch",".containing(.staticText, identifier: \"Username\").firstMatch"],[[[-1,2],[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app/*@START_MENU_TOKEN@*/.textFields["profileEditor_usernameField"]/*[[".otherElements",".textFields[\"g_kumar\"]",".textFields[\"Username\"]",".textFields[\"profileEditor_usernameField\"]",".textFields"],[[[-1,3],[-1,2],[-1,1],[-1,4],[-1,0,1]],[[-1,3],[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/.firstMatch.tap()
        app/*@START_MENU_TOKEN@*/.textFields["profileEditor_usernameField"]/*[[".otherElements",".textFields[\"g_kuma\"]",".textFields[\"Username\"]",".textFields[\"profileEditor_usernameField\"]",".textFields"],[[[-1,3],[-1,2],[-1,1],[-1,4],[-1,0,1]],[[-1,3],[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/.firstMatch.typeKey(.delete, modifierFlags:[])
        app/*@START_MENU_TOKEN@*/.textFields["profileEditor_usernameField"]/*[[".otherElements",".textFields[\"g_kum\"]",".textFields[\"Username\"]",".textFields[\"profileEditor_usernameField\"]",".textFields"],[[[-1,3],[-1,2],[-1,1],[-1,4],[-1,0,1]],[[-1,3],[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/.firstMatch.typeKey(.delete, modifierFlags:[])
        
        let element = app/*@START_MENU_TOKEN@*/.textFields["profileEditor_usernameField"]/*[[".otherElements",".textFields[\"g_ku\"]",".textFields[\"Username\"]",".textFields[\"profileEditor_usernameField\"]",".textFields"],[[[-1,3],[-1,2],[-1,1],[-1,4],[-1,0,1]],[[-1,3],[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/.firstMatch
        element.typeKey(.delete, modifierFlags:[])
        element.typeKey(.delete, modifierFlags:[])
        app/*@START_MENU_TOKEN@*/.textFields["profileEditor_usernameField"]/*[[".otherElements",".textFields[\"g_k\"]",".textFields[\"Username\"]",".textFields[\"profileEditor_usernameField\"]",".textFields"],[[[-1,3],[-1,2],[-1,1],[-1,4],[-1,0,1]],[[-1,3],[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/.firstMatch.typeKey(.delete, modifierFlags:[])
        app/*@START_MENU_TOKEN@*/.textFields["profileEditor_usernameField"]/*[[".otherElements",".textFields[\"g\"]",".textFields[\"Username\"]",".textFields[\"profileEditor_usernameField\"]",".textFields"],[[[-1,3],[-1,2],[-1,1],[-1,4],[-1,0,1]],[[-1,3],[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/.firstMatch.typeKey(.delete, modifierFlags:[])
        app/*@START_MENU_TOKEN@*/.textFields["profileEditor_usernameField"]/*[[".otherElements",".textFields[\"Username\"]",".textFields[\"profileEditor_usernameField\"]",".textFields"],[[[-1,2],[-1,1],[-1,3],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/.firstMatch.typeKey(.delete, modifierFlags:[])
        app/*@START_MENU_TOKEN@*/.textFields["profileEditor_usernameField"]/*[[".otherElements",".textFields[\"Muse_q\"]",".textFields[\"Username\"]",".textFields[\"profileEditor_usernameField\"]",".textFields"],[[[-1,3],[-1,2],[-1,1],[-1,4],[-1,0,1]],[[-1,3],[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/.firstMatch.typeText("muse_qa")
        app/*@START_MENU_TOKEN@*/.buttons["Done"]/*[[".otherElements.buttons[\"Done\"]",".buttons[\"Done\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.firstMatch.tap()
        app.windows.element(boundBy: 1).swipeDown()
        // UI tests must launch the application that they test.
        
        
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // XCUIAutomation Documentation
        // https://developer.apple.com/documentation/xcuiautomation
    }

    @MainActor
    func testLaunchPerformance() throws {
        // This measures how long it takes to launch your application.
        measure(metrics: [XCTApplicationLaunchMetric()]) {
            XCUIApplication().launch()
        }
    }
}
