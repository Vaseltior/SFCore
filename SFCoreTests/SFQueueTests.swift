//
//  SFQueueTests.swift
//  SFCore
//
//  Created by Samuel Grau on 10/04/2016.
//  Copyright © 2016 Samuel Grau. All rights reserved.
//

import XCTest
@testable import SFCore

class SFQueueTests: XCTestCase {

  var queue3: SFQueue<String>!
  var queue4: SFQueue<String>!

  override func setUp() {
    super.setUp()
    self.queue3 = SFQueue<String>()
    self.queue4 = SFQueue<String>()
  }

  override func tearDown() {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    super.tearDown()
  }

  func testFIFO() {
    self.queue4.enQueue("Dave Dee")
    self.queue4.enQueue("Dozy")
    self.queue4.enQueue("Beaky")
    XCTAssertEqual(self.queue4.deQueue(), "Dave Dee")
    XCTAssertEqual(self.queue4.deQueue(), "Dozy")
    XCTAssertEqual(self.queue4.deQueue(), "Beaky")
  }

  func testNilDequeue() {
    XCTAssertTrue(self.queue4.isEmpty())
    XCTAssertNil(self.queue4.peek())
    XCTAssertNil(self.queue4.deQueue())
    XCTAssertTrue(self.queue4.isEmpty())
  }

  func testNotNilDequeue() {
    self.queue4.enQueue("Dave Dee")
    self.queue4.enQueue("Dozy")
    self.queue4.enQueue("Beaky")

    XCTAssertFalse(self.queue4.isEmpty())
    XCTAssertNotNil(self.queue4.peek())
    XCTAssertNotNil(self.queue4.deQueue())
    XCTAssertFalse(self.queue4.isEmpty())
  }
}
