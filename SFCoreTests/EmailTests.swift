//
//  EmailTests.swift
//  SFCore
//
//  Created by Samuel Grau on 10/04/2016.
//  Copyright © 2016 Samuel Grau. All rights reserved.
//

import XCTest
@testable import SFCore

class EmailTests: XCTestCase {
  func testemptyStringEmail() {
    let e = Email(email: "")
    XCTAssertEqual(e.description, "")
    XCTAssertFalse(e.isValidEmail())
  }

  func testNonEmptyStringEmail() {
    let e = Email(email: "test@la.con")
    XCTAssertEqual(e.description, "test@la.con")
    XCTAssertTrue(e.isValidEmail())

    XCTAssertTrue(Email.isValidEmailString("test@la.com"))

  }
}
