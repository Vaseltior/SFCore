//
//  DoubleShortHandsTests.swift
//  SFCore
//
//  Created by Samuel Grau on 28/01/2016.
//  Copyright © 2016 Samuel Grau. All rights reserved.
//

import XCTest
@testable import SFCore

class DoubleShortHandsTests: XCTestCase {
  func testRoundedToPlaces() {
    XCTAssertEqual(1.23556789.roundToPlaces(3), 1.236)
    XCTAssertEqual(1.23556789.roundToPlaces(0), 1)
    XCTAssertEqual(0.15699999999999999999999.roundToPlaces(3), 0.157)
    XCTAssertEqual(15.699999999999999999999.roundToPlaces(0), 16)
    XCTAssertEqual(15.499999999999999999999.roundToPlaces(0), 16)
    XCTAssertEqual(15.399999999999999999999.roundToPlaces(0), 15)
    XCTAssertEqual(0.15699999999999999999999.roundToPlaces(2), 0.16)
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
  }
}
