//
//  iOS_calculateUITest.swift
//  iOS-calculateUITest
//
//  Created by Esther Alcoceba Gutiérrez de León on 21/7/22.
//

import XCTest

class iOS_calculateUITest: XCTestCase {
    
    var app: XCUIApplication!

    override func setUpWithError() throws {
        try super.setUpWithError()
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
    }
// Si da error cambiar el Code Signing Identity a iOS Developer para que nos deje grabar.
// iOS-calculate > Targets > iOS-calculate > Signing > Code Signing Identity > iOS Developer

    func testButton() {
        
        // Text del botón
        let number0Button = app.segmentedControls.buttons["0"]
        let number1Button = app.segmentedControls.buttons["1"]
        let number2Button = app.segmentedControls.buttons["2"]
        let number3Button = app.segmentedControls.buttons["3"]
        let number4Button = app.segmentedControls.buttons["4"]
        let number5Button = app.segmentedControls.buttons["5"]
        let number6Button = app.segmentedControls.buttons["6"]
        let number7Button = app.segmentedControls.buttons["7"]
        let number8Button = app.segmentedControls.buttons["8"]
        let number9Button = app.segmentedControls.buttons["9"]
        
        // Texto modificado al presionar el botón
        let number0Label = app.staticTexts["0"]
        let number1Label = app.staticTexts["1"]
        let number2Label = app.staticTexts["2"]
        let number3Label = app.staticTexts["3"]
        let number4Label = app.staticTexts["4"]
        let number5Label = app.staticTexts["5"]
        let number6Label = app.staticTexts["6"]
        let number7Label = app.staticTexts["7"]
        let number8Label = app.staticTexts["8"]
        let number9Label = app.staticTexts["9"]

        if number0Button.isSelected {
            XCTAssertTrue(number0Label.exists)
            XCTAssertFalse(number1Label.exists)
            XCTAssertFalse(number2Label.exists)
            XCTAssertFalse(number3Label.exists)
            XCTAssertFalse(number4Label.exists)
            XCTAssertFalse(number5Label.exists)
            XCTAssertFalse(number6Label.exists)
            XCTAssertFalse(number7Label.exists)
            XCTAssertFalse(number8Label.exists)
            XCTAssertFalse(number9Label.exists)

            number1Button.tap()
            XCTAssertTrue(number1Label.exists)
            XCTAssertFalse(number0Label.exists)
            XCTAssertFalse(number2Label.exists)
            XCTAssertFalse(number3Label.exists)
            XCTAssertFalse(number4Label.exists)
            XCTAssertFalse(number5Label.exists)
            XCTAssertFalse(number6Label.exists)
            XCTAssertFalse(number7Label.exists)
            XCTAssertFalse(number8Label.exists)
            XCTAssertFalse(number9Label.exists)
            
            number2Button.tap()
            XCTAssertTrue(number2Label.exists)
            XCTAssertFalse(number0Label.exists)
            XCTAssertFalse(number1Label.exists)
            XCTAssertFalse(number3Label.exists)
            XCTAssertFalse(number4Label.exists)
            XCTAssertFalse(number5Label.exists)
            XCTAssertFalse(number6Label.exists)
            XCTAssertFalse(number7Label.exists)
            XCTAssertFalse(number8Label.exists)
            XCTAssertFalse(number9Label.exists)
            
            number3Button.tap()
            XCTAssertTrue(number3Label.exists)
            XCTAssertFalse(number0Label.exists)
            XCTAssertFalse(number1Label.exists)
            XCTAssertFalse(number2Label.exists)
            XCTAssertFalse(number4Label.exists)
            XCTAssertFalse(number5Label.exists)
            XCTAssertFalse(number6Label.exists)
            XCTAssertFalse(number7Label.exists)
            XCTAssertFalse(number8Label.exists)
            XCTAssertFalse(number9Label.exists)
            
            number4Button.tap()
            XCTAssertTrue(number4Label.exists)
            XCTAssertFalse(number0Label.exists)
            XCTAssertFalse(number1Label.exists)
            XCTAssertFalse(number2Label.exists)
            XCTAssertFalse(number3Label.exists)
            XCTAssertFalse(number5Label.exists)
            XCTAssertFalse(number6Label.exists)
            XCTAssertFalse(number7Label.exists)
            XCTAssertFalse(number8Label.exists)
            XCTAssertFalse(number9Label.exists)
            
            number5Button.tap()
            XCTAssertTrue(number5Label.exists)
            XCTAssertFalse(number0Label.exists)
            XCTAssertFalse(number1Label.exists)
            XCTAssertFalse(number2Label.exists)
            XCTAssertFalse(number3Label.exists)
            XCTAssertFalse(number4Label.exists)
            XCTAssertFalse(number6Label.exists)
            XCTAssertFalse(number7Label.exists)
            XCTAssertFalse(number8Label.exists)
            XCTAssertFalse(number9Label.exists)
            
            number6Button.tap()
            XCTAssertTrue(number6Label.exists)
            XCTAssertFalse(number0Label.exists)
            XCTAssertFalse(number1Label.exists)
            XCTAssertFalse(number2Label.exists)
            XCTAssertFalse(number3Label.exists)
            XCTAssertFalse(number4Label.exists)
            XCTAssertFalse(number5Label.exists)
            XCTAssertFalse(number7Label.exists)
            XCTAssertFalse(number8Label.exists)
            XCTAssertFalse(number9Label.exists)
            
            number7Button.tap()
            XCTAssertTrue(number7Label.exists)
            XCTAssertFalse(number0Label.exists)
            XCTAssertFalse(number1Label.exists)
            XCTAssertFalse(number2Label.exists)
            XCTAssertFalse(number3Label.exists)
            XCTAssertFalse(number4Label.exists)
            XCTAssertFalse(number5Label.exists)
            XCTAssertFalse(number6Label.exists)
            XCTAssertFalse(number8Label.exists)
            XCTAssertFalse(number9Label.exists)
            
            number8Button.tap()
            XCTAssertTrue(number8Label.exists)
            XCTAssertFalse(number0Label.exists)
            XCTAssertFalse(number1Label.exists)
            XCTAssertFalse(number2Label.exists)
            XCTAssertFalse(number3Label.exists)
            XCTAssertFalse(number4Label.exists)
            XCTAssertFalse(number5Label.exists)
            XCTAssertFalse(number6Label.exists)
            XCTAssertFalse(number7Label.exists)
            XCTAssertFalse(number9Label.exists)
            
            number9Button.tap()
            XCTAssertTrue(number9Label.exists)
            XCTAssertFalse(number0Label.exists)
            XCTAssertFalse(number1Label.exists)
            XCTAssertFalse(number2Label.exists)
            XCTAssertFalse(number3Label.exists)
            XCTAssertFalse(number4Label.exists)
            XCTAssertFalse(number5Label.exists)
            XCTAssertFalse(number6Label.exists)
            XCTAssertFalse(number7Label.exists)
            XCTAssertFalse(number8Label.exists)
            
        } else if number1Button.isSelected {
            XCTAssertTrue(number1Label.exists)
            XCTAssertFalse(number0Label.exists)
            XCTAssertFalse(number2Label.exists)
            XCTAssertFalse(number3Label.exists)
            XCTAssertFalse(number4Label.exists)
            XCTAssertFalse(number5Label.exists)
            XCTAssertFalse(number6Label.exists)
            XCTAssertFalse(number7Label.exists)
            XCTAssertFalse(number8Label.exists)
            XCTAssertFalse(number9Label.exists)
            
            number0Button.tap()
            XCTAssertTrue(number0Label.exists)
            XCTAssertFalse(number1Label.exists)
            XCTAssertFalse(number2Label.exists)
            XCTAssertFalse(number3Label.exists)
            XCTAssertFalse(number4Label.exists)
            XCTAssertFalse(number5Label.exists)
            XCTAssertFalse(number6Label.exists)
            XCTAssertFalse(number7Label.exists)
            XCTAssertFalse(number8Label.exists)
            XCTAssertFalse(number9Label.exists)
            
        } else if number2Button.isSelected {
            XCTAssertTrue(number2Label.exists)
            XCTAssertFalse(number0Label.exists)
            XCTAssertFalse(number1Label.exists)
            XCTAssertFalse(number3Label.exists)
            XCTAssertFalse(number4Label.exists)
            XCTAssertFalse(number5Label.exists)
            XCTAssertFalse(number6Label.exists)
            XCTAssertFalse(number7Label.exists)
            XCTAssertFalse(number8Label.exists)
            XCTAssertFalse(number9Label.exists)
            
        } else if number3Button.isSelected {
            XCTAssertTrue(number3Label.exists)
            XCTAssertFalse(number0Label.exists)
            XCTAssertFalse(number1Label.exists)
            XCTAssertFalse(number2Label.exists)
            XCTAssertFalse(number4Label.exists)
            XCTAssertFalse(number5Label.exists)
            XCTAssertFalse(number6Label.exists)
            XCTAssertFalse(number7Label.exists)
            XCTAssertFalse(number8Label.exists)
            XCTAssertFalse(number9Label.exists)
            
        } else if number4Button.isSelected {
            XCTAssertTrue(number4Label.exists)
            XCTAssertFalse(number0Label.exists)
            XCTAssertFalse(number1Label.exists)
            XCTAssertFalse(number2Label.exists)
            XCTAssertFalse(number3Label.exists)
            XCTAssertFalse(number5Label.exists)
            XCTAssertFalse(number6Label.exists)
            XCTAssertFalse(number7Label.exists)
            XCTAssertFalse(number8Label.exists)
            XCTAssertFalse(number9Label.exists)
            
        } else if number5Button.isSelected {
            XCTAssertTrue(number5Label.exists)
            XCTAssertFalse(number0Label.exists)
            XCTAssertFalse(number1Label.exists)
            XCTAssertFalse(number2Label.exists)
            XCTAssertFalse(number3Label.exists)
            XCTAssertFalse(number4Label.exists)
            XCTAssertFalse(number6Label.exists)
            XCTAssertFalse(number7Label.exists)
            XCTAssertFalse(number8Label.exists)
            XCTAssertFalse(number9Label.exists)
            
        } else if number6Button.isSelected {
            XCTAssertTrue(number6Label.exists)
            XCTAssertFalse(number0Label.exists)
            XCTAssertFalse(number1Label.exists)
            XCTAssertFalse(number2Label.exists)
            XCTAssertFalse(number3Label.exists)
            XCTAssertFalse(number4Label.exists)
            XCTAssertFalse(number5Label.exists)
            XCTAssertFalse(number7Label.exists)
            XCTAssertFalse(number8Label.exists)
            XCTAssertFalse(number9Label.exists)
            
        } else if number7Button.isSelected {
            XCTAssertTrue(number7Label.exists)
            XCTAssertFalse(number0Label.exists)
            XCTAssertFalse(number1Label.exists)
            XCTAssertFalse(number2Label.exists)
            XCTAssertFalse(number3Label.exists)
            XCTAssertFalse(number4Label.exists)
            XCTAssertFalse(number5Label.exists)
            XCTAssertFalse(number6Label.exists)
            XCTAssertFalse(number8Label.exists)
            XCTAssertFalse(number9Label.exists)
            
        } else if number8Button.isSelected {
            XCTAssertTrue(number8Label.exists)
            XCTAssertFalse(number0Label.exists)
            XCTAssertFalse(number1Label.exists)
            XCTAssertFalse(number2Label.exists)
            XCTAssertFalse(number3Label.exists)
            XCTAssertFalse(number4Label.exists)
            XCTAssertFalse(number5Label.exists)
            XCTAssertFalse(number6Label.exists)
            XCTAssertFalse(number7Label.exists)
            XCTAssertFalse(number9Label.exists)
            
        } else if number9Button.isSelected {
            XCTAssertTrue(number9Label.exists)
            XCTAssertFalse(number0Label.exists)
            XCTAssertFalse(number1Label.exists)
            XCTAssertFalse(number2Label.exists)
            XCTAssertFalse(number3Label.exists)
            XCTAssertFalse(number4Label.exists)
            XCTAssertFalse(number5Label.exists)
            XCTAssertFalse(number6Label.exists)
            XCTAssertFalse(number7Label.exists)
            XCTAssertFalse(number8Label.exists)
        }
    }
}

