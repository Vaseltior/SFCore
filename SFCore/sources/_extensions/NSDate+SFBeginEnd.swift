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

public extension NSDate {
    
    /// MARK: Calculate Beginning / End of Day
    
    
    public func sfBeginningOfDay() -> NSDate? {
        let calendar = NSCalendar.currentCalendar()
        let components: NSDateComponents = calendar.components(
            NSCalendarUnit.CalendarUnitYear|NSCalendarUnit.CalendarUnitMonth|NSCalendarUnit.CalendarUnitDay,
            fromDate: self
        )
        return calendar.dateFromComponents(components)
    }
    
    public func sfEndOfDay() -> NSDate? {
        let calendar = NSCalendar.currentCalendar()
        let components: NSDateComponents = NSDateComponents()
        components.day = 1
        if let beginningOfDay = self.sfBeginningOfDay() {
            return calendar.dateByAddingComponents(
                components,
                toDate: beginningOfDay,
                options: NSCalendarOptions.MatchStrictly
            )?.dateByAddingTimeInterval(-1)
        }
        return nil
    }

    /// MARK: Calculate Beginning / End of Week
    
    
    public func sfBeginningOfWeek(calendar: NSCalendar = NSCalendar.currentCalendar()) -> NSDate? {
        let componentsCurrentDate = calendar.components(
            .CalendarUnitYear | .CalendarUnitMonth | .CalendarUnitDay | .CalendarUnitWeekday | .CalendarUnitWeekOfMonth,
            fromDate: self
        )
        let componentsNewDate = NSDateComponents()
        componentsNewDate.year = componentsCurrentDate.year
        componentsNewDate.month = componentsCurrentDate.month
        componentsNewDate.weekOfMonth = componentsCurrentDate.weekOfMonth
        componentsNewDate.weekday = calendar.firstWeekday
        
        return calendar.dateFromComponents(componentsNewDate)!
    }
    
    public func sfEndOfWeek() -> NSDate? {
        let calendar = NSCalendar.currentCalendar()
        let components: NSDateComponents = NSDateComponents()
        components.weekOfMonth = 1
        if let beginningOfWeek = self.sfBeginningOfWeek() {
            return calendar.dateByAddingComponents(
                components,
                toDate: beginningOfWeek,
                options: NSCalendarOptions.MatchStrictly
                )?.dateByAddingTimeInterval(-1)
        }
        return nil
    }
    
    
    /// MARK: Calculate Beginning / End of Month

    
    public func sfBeginningOfMonth() -> NSDate? {
        let calendar = NSCalendar.currentCalendar()
        let components: NSDateComponents = calendar.components(
            NSCalendarUnit.CalendarUnitYear|NSCalendarUnit.CalendarUnitMonth,
            fromDate: self
        )
        return calendar.dateFromComponents(components)
    }

    public func sfEndOfMonth() -> NSDate? {
        let calendar = NSCalendar.currentCalendar()
        let components: NSDateComponents = NSDateComponents()
        components.month = 1
        if let beginningOfMonth = self.sfBeginningOfMonth() {
            return calendar.dateByAddingComponents(
                components,
                toDate: beginningOfMonth,
                options: NSCalendarOptions.MatchStrictly
                )?.dateByAddingTimeInterval(-1)
        }
        return nil
    }

    /// MARK: Calculate Beginning / End of Year
    
    
    public func sfBeginningOfYear() -> NSDate? {
        let calendar = NSCalendar.currentCalendar()
        let components: NSDateComponents = calendar.components(
            NSCalendarUnit.CalendarUnitYear,
            fromDate: self
        )
        return calendar.dateFromComponents(components)

    }

    public func sfEndOfYear() -> NSDate? {
        let calendar = NSCalendar.currentCalendar()
        let components: NSDateComponents = NSDateComponents()
        components.year = 1
        if let beginningOfYear = self.sfBeginningOfYear() {
            return calendar.dateByAddingComponents(
                components,
                toDate: beginningOfYear,
                options: NSCalendarOptions.MatchStrictly
                )?.dateByAddingTimeInterval(-1)
        }
        return nil
    }

}
