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
        button1 = app.buttons["OneButton"]
        button2 = app.buttons["TwoButton"]
        button3 = app.buttons["ThreeButton"]
        button4 = app.buttons["FourButton"]
        button5 = app.buttons["FiveButton"]
        button6 = app.buttons["SixButton"]
        button7 = app.buttons["SevenButton"]
        button8 = app.buttons["EightButton"]
        button9 = app.buttons["NineButton"]
        buttonPlus = app.buttons["PlusButton"]
        buttonMinus = app.buttons["MinusButton"]
        buttonMultiply = app.buttons["MultiplyButton"]
        buttonDivide = app.buttons["DevideButton"]
        buttonEqual = app.buttons["EqualButton"]
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
