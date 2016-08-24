//
// The MIT License (MIT)
//
// Copyright (c) 2015 Samuel GRAU
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.
//

//
//  SFCore : NSDate+SFBeginEnd.swift
//
//  Created by Samuel Grau on 02/03/2015.
//  Copyright (c) 2015 Samuel Grau. All rights reserved.
//

import Foundation

extension Date {

  // MARK: Calculate Beginning / End of Day


  public func sfBeginningOfDay() -> Date? {
    let calendar = Calendar.current()
    let components: DateComponents = calendar.components(
      [Calendar.Unit.year,Calendar.Unit.month,Calendar.Unit.day],
      from: self
    )
    return calendar.date(from: components)
  }

  public func sfEndOfDay() -> Date? {
    let calendar = Calendar.current()
    var components: DateComponents = DateComponents()
    components.day = 1
    if let beginningOfDay = self.sfBeginningOfDay() {
      return calendar.date(
        byAdding: components,
        to: beginningOfDay,
        options: Calendar.Options.matchStrictly
        )?.addingTimeInterval(-1)
    }
    return nil
  }

  // MARK: Calculate Beginning / End of Week


  public func sfBeginningOfWeek(_ calendar: Calendar = Calendar.current()) -> Date? {
    let componentsCurrentDate = calendar.components(
      [.year, .month, .day, .weekday, .weekOfMonth],
      from: self
    )
    var componentsNewDate = DateComponents()
    componentsNewDate.year = componentsCurrentDate.year
    componentsNewDate.month = componentsCurrentDate.month
    componentsNewDate.weekOfMonth = componentsCurrentDate.weekOfMonth
    componentsNewDate.weekday = calendar.firstWeekday

    return calendar.date(from: componentsNewDate)!
  }

  public func sfEndOfWeek() -> Date? {
    let calendar = Calendar.current()
    var components: DateComponents = DateComponents()
    components.weekOfMonth = 1
    if let beginningOfWeek = self.sfBeginningOfWeek() {
      return calendar.date(
        byAdding: components,
        to: beginningOfWeek,
        options: Calendar.Options.matchStrictly
        )?.addingTimeInterval(-1)
    }
    return nil
  }


  // MARK: Calculate Beginning / End of Month


  public func sfBeginningOfMonth() -> Date? {
    let calendar = Calendar.current()
    let components: DateComponents = calendar.components(
      [Calendar.Unit.year,Calendar.Unit.month],
      from: self
    )
    return calendar.date(from: components)
  }

  public func sfEndOfMonth() -> Date? {
    let calendar = Calendar.current()
    var components: DateComponents = DateComponents()
    components.month = 1
    if let beginningOfMonth = self.sfBeginningOfMonth() {
      return calendar.date(
        byAdding: components,
        to: beginningOfMonth,
        options: Calendar.Options.matchStrictly
        )?.addingTimeInterval(-1)
    }
    return nil
  }

  // MARK: Calculate Beginning / End of Year


  public func sfBeginningOfYear() -> Date? {
    let calendar = Calendar.current()
    let components: DateComponents = calendar.components(
      Calendar.Unit.year,
      from: self
    )
    return calendar.date(from: components)

  }

  public func sfEndOfYear() -> Date? {
    let calendar = Calendar.current()
    var components: DateComponents = DateComponents()
    components.year = 1
    if let beginningOfYear = self.sfBeginningOfYear() {
      return calendar.date(
        byAdding: components,
        to: beginningOfYear,
        options: Calendar.Options.matchStrictly
        )?.addingTimeInterval(-1)
    }
    return nil
  }

}
