//
//  DateExtension.swift
//  SFCore
//
//  Created by Samuel Grau on 09/04/2016.
//  Copyright © 2016 Samuel Grau. All rights reserved.
//

import Foundation
import XCTest

extension NSDate {
  public final func dateXCAssert(year: Int, month: Int, day: Int, hour: Int = 0, minute: Int = 0, second: Int = 0) {
    let calendar = NSCalendar.autoupdatingCurrentCalendar()
    let components = calendar.components(
      [.Year, .Month, .Day, .Hour, .Minute, .Second],
      fromDate: self
    )
    XCTAssertEqual(components.year, year)
    XCTAssertEqual(components.month, month)
    XCTAssertEqual(components.day, day)
    XCTAssertEqual(components.hour, hour)
    XCTAssertEqual(components.minute, minute)
    XCTAssertEqual(components.second, second)
  }
}
