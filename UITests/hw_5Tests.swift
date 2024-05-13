//
//  hw_5Tests.swift
//  UITests
//
//  Created by o.evstigneev on 13.05.2024.
//

import XCTest

final class hw_5Tests: XCTestCase {
    
    let app = XCUIApplication()
    
    
    var btnZero: XCUIElement!
    var btnOne: XCUIElement!
    var btnTwo: XCUIElement!
    var btnThree: XCUIElement!
    var btnFour: XCUIElement!
    var btnFive: XCUIElement!
    var btnSix: XCUIElement!
    var btnSeven: XCUIElement!
    var btnEight: XCUIElement!
    var btnNine: XCUIElement!
    var btnPlus: XCUIElement!
    var btnMinus: XCUIElement!
    var btnMultiply: XCUIElement!
    var btnDivide: XCUIElement!
    var btnResult: XCUIElement!
    var btnAC: XCUIElement!
    var resultString: XCUIElement!

    override func setUpWithError() throws {
        continueAfterFailure = false
        app.launch()
        
        btnZero = app.buttons["ZeroButton"]
        btnOne = app.buttons["OneButton"]
        btnTwo = app.buttons["TwoButton"]
        btnThree = app.buttons["ThreeButton"]
        btnFour = app.buttons["FourButton"]
        btnFive = app.buttons["FiveButton"]
        btnSix = app.buttons["SixButton"]
        btnSeven = app.buttons["SevenButton"]
        btnEight = app.buttons["EightButton"]
        btnNine = app.buttons["NineButton"]
        btnMultiply = app.buttons["MultiplyButton"]
        btnMinus = app.buttons["MinusButton"]
        btnMultiply = app.buttons["MultiplyButton"]
        btnDivide = app.buttons["DevideButton"]
        btnResult = app.buttons["doResultButton"]
        btnAC = app.buttons["ACButton"]
        resultString = app.buttons["resultString"]
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testMultiply() throws{
        let expected = "12"
        btnTwo.tap()
        btnMultiply.tap()
        btnSix.tap()
        btnResult.tap()
        XCTAssert(resultString.staticTexts[expected].exists)
    }
    
    func testDevide() throws{
        let expected = "3"
        btnNine.tap()
        btnDivide.tap()
        btnThree.tap()
        btnResult.tap()
        XCTAssert(resultString.staticTexts[expected].exists)
    }
    
    func testAC() throws{
        let expected = "0"
        btnOne.tap()
        btnFive.tap()
        btnSeven.tap()
        btnAC.tap()
        XCTAssert(resultString.staticTexts[expected].exists)
    }
}
