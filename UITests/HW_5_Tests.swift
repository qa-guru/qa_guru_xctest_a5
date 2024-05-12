//
//  HW_5_Tests.swift
//  UITests
//
//  Created by Denis Doroshenko on 11.05.2024.
//

import XCTest

final class HW_5_Tests: XCTestCase {
    
    let app = XCUIApplication()
    
    var oneBtn: XCUIElement!
    var twoBtn: XCUIElement!
    var sevenBtn: XCUIElement!
    var eightBtn: XCUIElement!
    //etc.
    
    var floatNumberBtn: XCUIElement!
    var multiplicationBtn: XCUIElement!
    var sumBtn: XCUIElement!
    var divisionBtn: XCUIElement!
    var percentBtn: XCUIElement!
    var resultBtn: XCUIElement!
    var ACBtn: XCUIElement!
    
    var result: XCUIElement!
    
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // UI tests must launch the application that they test.
        app.launch()
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        
        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
        setupUIElements()
    }
    
    func setupUIElements() {
        oneBtn = app.buttons["OneButton"].firstMatch
        twoBtn = app.buttons["TwoButton"].firstMatch
        sevenBtn = app.buttons["SevenButton"].firstMatch
        eightBtn = app.buttons["EightButton"].firstMatch
        // Initialize other UI elements
        
        sumBtn = app.staticTexts["+"]
        multiplicationBtn = app.staticTexts["x"]
        divisionBtn = app.staticTexts["÷"]
        percentBtn = app.staticTexts["%"]
        resultBtn = app.staticTexts["="]
        floatNumberBtn = app.staticTexts["floatNumberButton"]
        ACBtn = app.staticTexts["AC"]
        
        result = app.staticTexts["resultString"]
    }
    
    func testSimpleSumPresentation(){
        let sum = "\(1 + 22)"
        
        oneBtn.tap()
        sumBtn.tap()
        twoBtn.doubleTap()
        resultBtn.tap()
        
        XCTAssert(result.staticTexts[sum].exists, "Wrong result")
    }
    
    func testMultiplicationAndDivision() throws {
        let multiplicationResult = "\(77 * 88)"
        let divisionResult = "\((77 * 88) / 2)"
        
        performCalculation(firstNumber: "77",
                           secondNumber: "88",
                           operationButton: multiplicationBtn,
                           expectedResult: multiplicationResult)
        
        reset()
        
        performCalculation(firstNumber: multiplicationResult,
                           secondNumber: "2",
                           operationButton: divisionBtn,
                           expectedResult: divisionResult)
    }
    
    func testPercentOperation() throws {
        let number = 25.0
        let total = 100.0
        
        let percentage = calculatePercentage(of: number, from: total)
        
        performCalculation(firstNumber: "25",
                           secondNumber: "100",
                           operationButton: percentBtn,
                           expectedResult: "\(percentage)")
    }
    
    func performCalculation(firstNumber: String, secondNumber: String, operationButton: XCUIElement, expectedResult: String) {
        enterNumber(number: firstNumber)
        operationButton.tap()
        enterNumber(number: secondNumber)
        resultBtn.tap()
        
        XCTAssert(result.staticTexts[expectedResult].exists, "Wrong result")
    }
    
    func enterNumber(number: String) {
        for digit in number {
            app.buttons["\(digit)"].firstMatch.tap()
        }
    }
    
    func reset(){
        ACBtn.tap()
        XCTAssert(result.staticTexts["0"].exists)
    }
    
    func calculatePercentage(of number: Double, from total: Double) -> Double {
        return (number / total) * 100
    }
    
}
