//
//  ArrayTests.swift
//  SFCore
//
//  Created by Samuel Grau on 10/04/2016.
//  Copyright © 2016 Samuel Grau. All rights reserved.
//

import XCTest
@testable import SFCore

class ArrayTests: XCTestCase {

  func testArrayFunctions() {
    let a = [1, 5, 8, 9, 11]
    XCTAssertEqual(a.sfFirstObject(), 1)
    XCTAssertEqual(a.sfLastObject(), 11)

    XCTAssertTrue(a.sfIsIndexInBounds(0))
    XCTAssertTrue(a.sfIsIndexInBounds(3))
    XCTAssertTrue(a.sfIsIndexInBounds(4))
    XCTAssertFalse(a.sfIsIndexInBounds(-1))
    XCTAssertFalse(a.sfIsIndexInBounds(5))

    XCTAssertFalse(a.sfIsIndexOutOfBounds(0))
    XCTAssertFalse(a.sfIsIndexOutOfBounds(3))
    XCTAssertFalse(a.sfIsIndexOutOfBounds(4))
    XCTAssertTrue(a.sfIsIndexOutOfBounds(-1))
    XCTAssertTrue(a.sfIsIndexOutOfBounds(5))

    XCTAssertTrue(Array<Int>.isSortedAscendingly(a))
    let b = [1,5,1,9,11]
    XCTAssertFalse(Array<Int>.isSortedAscendingly(b))

    let c: Array<Int> = []
    XCTAssertNil(c.sfFirstObject())
    XCTAssertNil(c.sfLastObject())
  }

}
