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
//  SFCore : NSDate+SFComputations.swift
//
//  Created by Samuel Grau on 02/03/2015.
//  Copyright (c) 2015 Samuel Grau. All rights reserved.
//

import Foundation

public extension NSDate {
    
    ///
    /// Returns the number of seconds in one year
    ///
    /// :returns: the number of of seconds in one year
    ///
    public class func sfYearInSeconds() -> NSTimeInterval {
        return 365 * (60 * 60 * 24)
    }
    
    ///
    /// Returns the number of days between two dates
    ///
    /// :param: startDate The start date
    /// :param: endDate The end date
    ///
    /// :returns: the number of days between two dates
    ///
    public class func sfNumberOfDaysBetween(startDate: NSDate, endDate: NSDate) -> Int {
        precondition(startDate <= endDate, "startDate should be less than endDate")
        let gregorianCalendar: NSCalendar = NSCalendar(calendarIdentifier:NSGregorianCalendar)!
        let components: NSDateComponents = gregorianCalendar.components(
            NSCalendarUnit.CalendarUnitDay,
            fromDate: startDate,
            toDate: endDate,
            options: NSCalendarOptions.MatchStrictly
        )
        return components.day
    }
}

/// MARK: - Comparable -

extension NSDate: Comparable {}

public func ==(lhs: NSDate, rhs: NSDate) -> Bool {
    return lhs === rhs || lhs.compare(rhs) == .OrderedSame
}

public func <(lhs: NSDate, rhs: NSDate) -> Bool {
    return lhs.compare(rhs) == .OrderedAscending
}

public func >(lhs: NSDate, rhs: NSDate) -> Bool {
    return lhs.compare(rhs) == .OrderedDescending
}

