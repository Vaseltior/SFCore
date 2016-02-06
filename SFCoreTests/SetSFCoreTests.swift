//
//  SetSFCoreTests.swift
//  SFCore
//
//  Created by Samuel Grau on 26/01/2016.
//  Copyright © 2016 Samuel Grau. All rights reserved.
//

import XCTest
@testable import SFCore

class SetSFCoreTests: XCTestCase {

  override func setUp() {
    super.setUp()
    // Put setup code here. This method is called before the invocation of each test method in the class.
  }

  override func tearDown() {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    super.tearDown()
  }

  func testMapCardinalityOnSet() {
    let a: Set<Int> = [4, 6, 1, 5]
    let b = a.map { $0 + 1}
    XCTAssertTrue(a.count == b.count, "The cardinality of the initial and the resulting set should be equal")
  }

  func testMapIdentityOnSet() {
    let a: Set<Int> = [4, 6, 1, 5]
    let b = a.map { $0 }
    a.forEach {
      XCTAssertTrue(b.contains($0), "Every element of a should exist in b")
    }

  }
}
