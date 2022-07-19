//
//  iOS_calculateTests.swift
//  iOS-calculateTests
//
//  Created by Esther Alcoceba Gutiérrez de León on 18/7/22.
//

import XCTest
@testable import iOS_calculate //Acceso a los tipos y funciones internos de la app

class iOS_calculateTests: XCTestCase {
    
    var sut: HomeViewController!  // Objeto que se va a testar
    
    enum OperationType {
        case none, addition, substraction, multiplication, division, percent
    }

    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = HomeViewController()
    }

    override func tearDownWithError() throws {
        sut = nil
        try super.tearDownWithError()
    }

    func testClearResultLabelAndResetVariables() throws {
        sut.clear()
        XCTAssertEqual(sut.total, 0)
    }
    
    func testOperatorAdditionAction() throws {
        sut.operatorAddition
        XCTAssert(true)
    }
    
    func testResultForOperationIsNone() throws {
        sut.operation = .none
        sut.result()
        XCTAssertEqual(sut.total, 0)
    }
    
    func testResultForOperationIsAddition() throws {
        sut.operation = .addition
        sut.total = 1
        sut.temp = 5
        sut.result()
        XCTAssertEqual(sut.total, 6)
    }
    
    func testResultForOperationIsSubstraction() throws {
        sut.operation = .substraction
        sut.total = 1
        sut.temp = 5
        sut.result()
        XCTAssertEqual(sut.total, -4)
    }
    
    func testResultForOperationIsMultiplication() throws {
        sut.operation = .multiplication
        sut.total = 2
        sut.temp = 5
        sut.result()
        XCTAssertEqual(sut.total, 10)
    }
    
    func testResultForOperationIsDivision() throws {
        sut.operation = .division
        sut.total = 2
        sut.temp = 10
            sut.result()
        XCTAssertEqual(sut.total, 0.2)
    }

    func testResultForOperationIsPercent() throws {
        sut.operation = .percent
        sut.total = 1
        sut.temp = 5
        sut.result()
        XCTAssertEqual(sut.total, 0.05)
    }
}
