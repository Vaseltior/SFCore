//
//  BoundiTests.swift
//  SFCore
//
//  Created by Samuel Grau on 10/04/2016.
//  Copyright © 2016 Samuel Grau. All rights reserved.
//

import XCTest
@testable import SFCore

class BoundiTests: XCTestCase {

  func testIntBoundi() {
    XCTAssertEqual(Int.boundi(5, min: 0, max: 4), 4)
    XCTAssertEqual(Int.boundi(3, min: 0, max: 4), 3)
    XCTAssertEqual(Int.boundi(-1, min: 0, max: 4), 0)
    XCTAssertEqual(Int.boundi(-1, min: 5, max: 4), 5)
    XCTAssertEqual(Int.boundi(2, min: 5, max: 4), 5)
  }

  func testUIntBoundi() {
    XCTAssertEqual(UInt.boundi(5, min: 0, max: 4), 4)
    XCTAssertEqual(UInt.boundi(3, min: 0, max: 4), 3)
    XCTAssertEqual(UInt.boundi(0, min: 0, max: 4), 0)
    XCTAssertEqual(UInt.boundi(0, min: 5, max: 4), 5)
    XCTAssertEqual(UInt.boundi(0, min: 5, max: 4), 5)
  }
}
