//
//  GCDTests.swift
//  SFCore
//
//  Created by Samuel Grau on 03/02/2016.
//  Copyright © 2016 Samuel Grau. All rights reserved.
//

import XCTest

class GCDTests: XCTestCase {
  func testGCDMainThread() {
    gcdMainThread {
      XCTAssertTrue(NSThread.isMainThread(), "The closure should be executed in the main thread")
    }
  }
}
