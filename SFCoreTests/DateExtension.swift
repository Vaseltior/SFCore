//
//  DateExtension.swift
//  SFCore
//
//  Created by Samuel Grau on 09/04/2016.
//  Copyright © 2016 Samuel Grau. All rights reserved.
//

import Foundation
import XCTest

extension Date {
  public func dateXCAssert(_ year: Int, month: Int, day: Int, hour: Int = 0, minute: Int = 0, second: Int = 0) {
    let calendar = Calendar.autoupdatingCurrent()
    let components = calendar.components(
      [.year, .month, .day, .hour, .minute, .second],
      from: self
    )
    XCTAssertEqual(components.year, year)
    XCTAssertEqual(components.month, month)
    XCTAssertEqual(components.day, day)
    XCTAssertEqual(components.hour, hour)
    XCTAssertEqual(components.minute, minute)
    XCTAssertEqual(components.second, second)
  }
}
