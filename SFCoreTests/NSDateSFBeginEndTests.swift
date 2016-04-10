//
//  NSDateSFBeginEndTests.swift
//  SFCore
//
//  Created by Samuel Grau on 08/04/2016.
//  Copyright © 2016 Samuel Grau. All rights reserved.
//

import XCTest
import UIKit
@testable import SFCore

class NSDateSFBeginEndTests: XCTestCase {

  func testSFBeginningOfDay() {
    // True in weekday after 06h - 1454907600 le 8/2/2016 à 6:00:00
    let d = NSDate(timeIntervalSince1970: 1454907600)
    let r = d.sfBeginningOfDay()
    XCTAssertNotNil(r)
    r!.dateXCAssert(2016, month: 02, day: 8)
  }

  func testSFEndOfDay() {
    // True in weekday after 06h - 1454907600 le 8/2/2016 à 6:00:00
    let d = NSDate(timeIntervalSince1970: 1454907600)
    let r = d.sfEndOfDay()
    XCTAssertNotNil(r)
    r!.dateXCAssert(2016, month: 02, day: 8, hour: 23, minute: 59, second: 59)
  }

  func testSFBeginningOfWeek() {
    // True in weekday after 06h - 1454907600 le 8/2/2016 à 6:00:00
    let d = NSDate(timeIntervalSince1970: 1454907600)
    let r = d.sfBeginningOfWeek()
    XCTAssertNotNil(r)
    r!.dateXCAssert(2016, month: 02, day: 7, hour: 0, minute: 0, second: 0)
  }

  func testSFEndOfWeek() {
    // True in weekday after 06h - 1454907600 le 8/2/2016 à 6:00:00
    let d = NSDate(timeIntervalSince1970: 1454907600)
    let r = d.sfEndOfWeek()
    XCTAssertNotNil(r)
    r!.dateXCAssert(2016, month: 02, day: 13, hour: 23, minute: 59, second: 59)
  }

  func testSFBeginningOfMonth() {
    // True in weekday after 06h - 1454907600 le 8/2/2016 à 6:00:00
    let d = NSDate(timeIntervalSince1970: 1454907600)
    let r = d.sfBeginningOfMonth()
    XCTAssertNotNil(r)
    r!.dateXCAssert(2016, month: 02, day: 1, hour: 0, minute: 0, second: 0)
  }

  func testSFEndOfMonth() {
    // True in weekday after 06h - 1454907600 le 8/2/2016 à 6:00:00
    let d = NSDate(timeIntervalSince1970: 1454907600)
    let r = d.sfEndOfMonth()
    XCTAssertNotNil(r)
    r!.dateXCAssert(2016, month: 02, day: 29, hour: 23, minute: 59, second: 59)
  }

  func testSFBeginningOfYear() {
    // True in weekday after 06h - 1454907600 le 8/2/2016 à 6:00:00
    let d = NSDate(timeIntervalSince1970: 1454907600)
    let r = d.sfBeginningOfYear()
    XCTAssertNotNil(r)
    r!.dateXCAssert(2016, month: 1, day: 1, hour: 0, minute: 0, second: 0)
  }

  func testSFEndOfYear() {
    // True in weekday after 06h - 1454907600 le 8/2/2016 à 6:00:00
    let d = NSDate(timeIntervalSince1970: 1454907600)
    let r = d.sfEndOfYear()
    XCTAssertNotNil(r)
    r!.dateXCAssert(2016, month: 12, day: 31, hour: 23, minute: 59, second: 59)
  }

  func testYearInSeconds() {
    XCTAssertEqual(NSDate.sfYearInSeconds(), 31536000)
  }

  func testNumberOfDaysBetweenDates() {
    let d1 = NSDate(timeIntervalSince1970: 0)
    var d2 = NSDate(timeIntervalSince1970: 8600)
    XCTAssertEqual(NSDate.sfNumberOfDaysBetween(d1, endDate: d2), 0)
    d2 = NSDate(timeIntervalSince1970: 86400)
    XCTAssertEqual(NSDate.sfNumberOfDaysBetween(d1, endDate: d2), 1)
  }

  func testComparisons() {
    let d1 = NSDate(timeIntervalSince1970: 0)
    var d2 = NSDate(timeIntervalSince1970: 8600)
    XCTAssertFalse(d1 == d2)
    XCTAssertTrue(d1 < d2)
    XCTAssertTrue(d2 > d1)
    d2 = NSDate(timeIntervalSince1970: 0)
    XCTAssertTrue(d1 == d2)
    XCTAssertTrue(d1 <= d2)
  }
}
