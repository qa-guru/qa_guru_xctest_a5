//
//  newTests.swift
//  UITests
//
//  Created by User on 03.07.2024.
//

import Foundation
import XCTest

final class newTests: XCTestCase {
    
    let app = XCUIApplication()
    
    var buttonZero: XCUIElement!
    var buttonOne: XCUIElement!
    var buttonThree: XCUIElement!
    var buttonFour: XCUIElement!
    var buttonFive: XCUIElement!
    var buttonEquals: XCUIElement!
    var buttonDivide: XCUIElement!
    var buttonMinus: XCUIElement!
    var buttonMultiple: XCUIElement!
    var resultString: XCUIElement!
    
    
    override func setUpWithError() throws {
        continueAfterFailure = false
        
        app.launch()
        
        buttonZero = app.buttons["ZeroButton"]
        buttonOne = app.buttons["buttonOne"]
        buttonThree = app.buttons["buttonThree"]
        buttonFour = app.buttons["buttonFour"]
        buttonFive = app.buttons["buttonFive"]
        buttonEquals = app.buttons["buttonEquals"]
        buttonDivide = app.buttons["buttonDivide"]
        buttonMinus = app.buttons["buttonMinus"]
        buttonMultiple = app.buttons["buttonMultiple"]
        resultString = app.buttons["resultString"]
    }
    
    func testMultiply() throws {
        let expect = "20"
        app.launch()
        
        buttonFour.tap()
        buttonMultiple.tap()
        buttonFive.tap()
        buttonEquals.tap()
        XCTAssert(resultString.staticTexts[expect].exists)
    }
    
    func testDivide() throws {
        let expect = "9"
        app.launch()
        
        buttonFour.tap()
        buttonFive.tap()
        buttonDivide.tap()
        buttonFive.tap()
        buttonEquals.tap()
        XCTAssert(resultString.staticTexts[expect].exists)
    }
    
    
    func testMinus() throws {
        let expect = "70"
        app.launch()
        
        buttonOne.tap()
        buttonZero.tap()
        buttonZero.tap()
        buttonMinus.tap()
        buttonThree.tap()
        buttonZero.tap()
        buttonEquals.tap()
        XCTAssert(resultString.staticTexts[expect].exists)
    }
    
}
