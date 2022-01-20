//
//  TriangleAppTDDTests.swift
//  TriangleAppTDDTests
//
//  Created by Irsyad Ashari on 19/01/22.
//

import XCTest
@testable import TriangleAppTDD

class TriangleAppTDDTests: XCTestCase {
    
    func testInequalityTriangle() {
      XCTAssertThrowsError(try detectTriangle(4, 1, 2)) { error in
        XCTAssertEqual(error as? TriangleError, TriangleError.inequalityInput)
      }
      XCTAssertThrowsError(try detectTriangle(5, 1, 3)) { error in
        XCTAssertEqual(error as? TriangleError, TriangleError.inequalityInput)
      }
    }
    
    func testDetectRandomTriangle() {
        XCTAssertEqual(try detectTriangle(1, 2, 3), "Segitiga Sembarang")
    }
    
    func testDetectEquilateralTriangle() {
        XCTAssertEqual(try detectTriangle(1, 2, 2), "Segitiga Sama Kaki")
    }
    
    func testInvalidInputSides() {
        XCTAssertThrowsError(try detectTriangle(-1,2,3)) { error in
            XCTAssertEqual(error as? TriangleError, TriangleError.invalidInput)
        }
    }
    
    func detectTriangle(_ sideA: Int, _ sideB: Int, _ sideC: Int) throws -> String {
        
        let sides = [sideA, sideB, sideC]
        let checkedSides = sides.filter({ $0  >= 1 })
        guard checkedSides.count == 3 else { throw TriangleError.invalidInput}
        guard sideA+sideB <= sideC else { throw TriangleError.inequalityInput}
        
        switch Set(checkedSides).count {
        case 1:
            return "Segitiga Sama Sisi"
        case 2:
            return "Segitiga Sama Kaki"
        default:
            return "Segitiga Sembarang"
        }
//        for side in [sideA, sideB, sideC] {
//            if side < 0 {
//                throw TriangleError.invalidInput
//            }
//        }
//        if sideA == sideB &&
//            sideB == sideC &&
//            sideA == sideC {
//            return "Segitiga Sama Sisi"
//        } else if sideA == sideB || sideA == sideC || sideB == sideC {
//            return "Segitiga Sama Kaki"
//        } else {
//            return "Bukan Segitiga Sama Sisi"
//        }
    }
}

enum TriangleError: Error {
    case invalidInput
    case inequalityInput
}
