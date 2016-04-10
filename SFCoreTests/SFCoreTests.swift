//
//  SFCoreTests.swift
//  SFCoreTests
//
//  Created by Samuel Grau on 01/03/2015.
//  Copyright (c) 2015 Samuel Grau. All rights reserved.
//

import UIKit
import XCTest
@testable import SFCore

class SFCoreTests: XCTestCase {
  
  override func setUp() {
    super.setUp()
    // Put setup code here. This method is called before the invocation of each test method in the class.
  }
  
  override func tearDown() {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    super.tearDown()
  }
  
  func testExample() {
    // This is an example of a functional test case.
    XCTAssert(true, "Pass")
    SFFileManager.createDirectoryInDocumentsDirectory("555")
    let dd = SFFileManager.documentsDirectory() + "/555/file.txt"
    let data = "here".dataUsingEncoding(NSUTF8StringEncoding)!
    XCTAssertTrue(SFFileManager.createFileAtPath(data, atPath: dd))
    XCTAssertFalse(SFFileManager.createFileAtPath(data, atPath: ""))
    XCTAssertEqual(SFFileManager.contentOfFileAtPath(dd), "here")
    XCTAssertNil(SFFileManager.removeFileAtPath(dd))
    XCTAssertNotNil(SFFileManager.removeFileAtPath(dd))
    XCTAssertEqual(SFFileManager.contentOfFileAtPath(dd), "")

    SFFileManager.mainBundleDirectory()
    SFFileManager.temporaryDirectory()
    SFFileManager.cachesDirectory()
    SFFileManager.userFile()
  }
  
  func testPerformanceExample() {
    // This is an example of a performance test case.
    self.measureBlock() {
      // Put the code you want to measure the time of here.
    }
  }
  
}
