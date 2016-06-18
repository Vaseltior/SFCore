//
//  String+SFCharactersTests.swift
//  SFCore
//
//  Created by Samuel Grau on 14/01/2016.
//  Copyright © 2016 Samuel Grau. All rights reserved.
//

import XCTest
@testable import SFCore

class StringSFCharactersTests: XCTestCase {
  
  override func setUp() {
    super.setUp()
    // Put setup code here. This method is called before the invocation of each test method in the class.
  }
  
  override func tearDown() {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    super.tearDown()
  }
  
  func testCharacterGet() {
    let s = "toto"
    XCTAssert(s.getCharacter(0) == "t")
    XCTAssert(s.getCharacter(1) == "o")
    XCTAssert(s.getCharacter(2) == "t")
    XCTAssert(s.getCharacter(3) == "o")
    XCTAssert(s[0] == "t")
    XCTAssert(s[1] == "o")
    XCTAssert(s[2] == "t")
    XCTAssert(s[3] == "o")
    XCTAssert(s.characterString(0) == "t")
    XCTAssert(s.characterString(1) == "o")
    XCTAssert(s.characterString(2) == "t")
    XCTAssert(s.characterString(3) == "o")
  }
  
  func testCapitalizeFirst() {
    let s = "toto"
    XCTAssert(s.capitalizeFirst == "Toto")
  }
  
  func testTrim() {
    var s = "   toto"
    XCTAssert(s.trim == "toto")
    s = "   toto            \n\n"
    XCTAssert(s.trim == "toto")
    s = "toto       "
    XCTAssert(s.trim == "toto")
  }
  
  func testToNSNumber() {
    let goodString = "0"
    XCTAssertTrue(
      NSNumber(value: 0).compare(goodString.toNSNumber()) == ComparisonResult.orderedSame,
      "Number should be 0"
    )
    let badString = "dflgjhdflkghdflgkjhd"
    XCTAssertTrue(
      NSNumber(value: 0).compare(badString.toNSNumber()) == ComparisonResult.orderedSame,
      "A bad string should return 0"
    )
    
    if let decimalSeparator = NumberFormatter().decimalSeparator {
      let decimalString = "123\(decimalSeparator)456"
      XCTAssertTrue(NSNumber(value: 123.456).compare(decimalString.toNSNumber()) == ComparisonResult.orderedSame)
    }
  }

  func testContains() {
    let s = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod"
    XCTAssertTrue(s.contains("Lorem"))
    XCTAssertFalse(s.contains("toto"))
    // Full range
    XCTAssertTrue(s.contains(s))
    // Empty
    XCTAssertFalse(s.contains(""))
  }
}
