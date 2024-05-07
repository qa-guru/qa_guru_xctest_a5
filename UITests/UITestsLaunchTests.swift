//
//  UITestsLaunchTests.swift
//  UITests
//
//  Created by vlad on 07.05.2024.
//

import XCTest

final class UITestsLaunchTests: XCTestCase {

    let app = XCUIApplication()
    let safari = XCUIApplication(bundleIdentifier: "com.apple.mobilesafari")

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    func testScreenshot() throws {
        app.launch()

        let attachment = XCTAttachment(screenshot: app.screenshot())
        attachment.name = "Launch Screen"
        attachment.lifetime = .keepAlways
        add(attachment)
    }
    
    func testDebugTree() throws {
        app.launch()
        print(app.debugDescription)
    }
    
    func testSum9() throws {
        let button4 = app.buttons["4"]
        
        app.launch()
        button4.tap()
        app.buttons["+"].tap()
        app.buttons["5"].tap()
        app.buttons["="].tap()
        XCTAssert(app.buttons["resultString"].staticTexts["9"].exists)
    }
    
    func testSum9Faster() throws {
        app.launch()
        app.buttons["4"].firstMatch.tap()
        app.buttons["+"].firstMatch.tap()
        app.buttons["5"].firstMatch.tap()
        app.buttons["="].firstMatch.tap()
        XCTAssert(app.buttons["resultString"].staticTexts["9"].firstMatch.exists)
    }
    
    func testAC() throws {
        app.launch()
        app.buttons["7"].tap()
        app.buttons["7"].tap()
        app.buttons["+"].tap()
        app.buttons["ZeroButton"].tap()
        app.buttons["="].tap()
        XCTAssert(app.buttons["resultString"].staticTexts["77"].exists)
        app.buttons["AC"].tap()
        XCTAssert(app.buttons["resultString"].staticTexts["0"].exists)
    }
    
    func testRecorded() throws {
        app.launch()
        let button = app.buttons["2"]
        button.tap()
        app.buttons["+"].tap()
        button.tap()
        app/*@START_MENU_TOKEN@*/.staticTexts["="]/*[[".buttons[\"=\"].staticTexts[\"=\"]",".staticTexts[\"=\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        XCTAssert(app.buttons["resultString"].staticTexts["4"].exists)
    }
    
    func testSkip() throws {
        app.launch()
        try XCTSkipIf(true, "Так нужно")
    }
    
    func testFail() throws {
        app.launch()
        XCTFail("Очень нужно!")
    }
    
    func testSafari() throws {
        safari.launch()
        app.launch()
    }
}
