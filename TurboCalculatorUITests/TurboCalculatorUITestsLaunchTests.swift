//
//  TurboCalculatorUITestsLaunchTests.swift
//  TurboCalculatorUITests
//
//  Created by Alexey Melnik on 09/05/2024.
//

import XCTest

final class TurboCalculatorUITestsLaunchTests: XCTestCase {

    let app = XCUIApplication()
    
    var button0: XCUIElement!
    var button1: XCUIElement!
    var button2: XCUIElement!
    var button3: XCUIElement!
    var button4: XCUIElement!
    var button5: XCUIElement!
    var button6: XCUIElement!
    var button7: XCUIElement!
    var button8: XCUIElement!
    var button9: XCUIElement!
    var buttonPlus: XCUIElement!
    var buttonMinus: XCUIElement!
    var buttonMultiply: XCUIElement!
    var buttonDivide: XCUIElement!
    var buttonEqual: XCUIElement!
    var resultString: XCUIElement!
    
    override class var runsForEachTargetApplicationUIConfiguration: Bool {
        false
    }

    override func setUpWithError() throws {
        continueAfterFailure = false
        app.launch()
        
        button0 = app.buttons["ZeroButton"]
        button1 = app.buttons["1"]
        button2 = app.buttons["2"]
        button3 = app.buttons["3"]
        button4 = app.buttons["4"]
        button5 = app.buttons["5"]
        button6 = app.buttons["6"]
        button7 = app.buttons["7"]
        button8 = app.buttons["8"]
        button9 = app.buttons["9"]
        buttonPlus = app.buttons["+"]
        buttonMinus = app.buttons["-"]
        buttonMultiply = app.buttons["x"]
        buttonDivide = app.buttons["÷"]
        buttonEqual = app.buttons["="]
        resultString = app.buttons["resultString"]
    }

    func testScreenshot() throws {
        let attachment = XCTAttachment(screenshot: app.screenshot())
        attachment.name = "Launch Screen"
        attachment.lifetime = .keepAlways
        add(attachment)
    }
    
    func testDebugTree() throws{
        print(app.debugDescription)
    }
    
    func testSum() throws{
        button4.tap()
        buttonPlus.tap()
        button5.tap()
        buttonEqual.tap()
        XCTAssert(resultString.staticTexts["9"].firstMatch.exists)
    }
    
    func testAC() throws{
        button7.doubleTap()
        buttonPlus.tap()
        button0.tap()
        buttonEqual.tap()
        XCTAssert(resultString.staticTexts["77"].exists)
    }
    
    func testMultiplication() throws {
        button2.tap()
        buttonMultiply.tap()
        button3.tap()
        buttonEqual.tap()
        XCTAssert(resultString.staticTexts["6"].exists)
    }
        
    func testSubtraction() throws {
        button9.tap()
        buttonMinus.tap()
        button1.tap()
        buttonEqual.tap()
        XCTAssert(resultString.staticTexts["8"].exists)
    }
        
    func testDivision() throws {
        button9.tap()
        buttonDivide.tap()
        button3.tap()
        buttonEqual.tap()
        XCTAssert(resultString.staticTexts["3"].exists)
        }
}
