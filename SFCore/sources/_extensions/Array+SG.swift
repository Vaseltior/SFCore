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
//  SFCore : Array+SG.swit
//
//  Created by Samuel Grau on 01/03/2015.
//  Copyright (c) 2015 Samuel Grau. All rights reserved.
//
//



import Foundation

extension Array {
    
    ///
    /// Returns the first object of the array, if the array
    /// is not empty
    ///
    /// - returns: Returns the first object of the array, if the array
    /// is not empty, otherwise, return nil.
    ///
    func sfFirstObject() -> Element? {
        return (self.isEmpty ? nil : self[0])
    }
    
    ///
    /// Returns the first object of the array, if the array
    /// is not empty
    ///
    /// - returns: Returns the first object of the array, if the array
    /// is not empty, otherwise, return nil.
    ///
    func sfLastObject() -> Element? {
        return (self.isEmpty ? nil : self[self.count-1])
    }
    
    ///
    /// Tell if the given index is out of the bounds of the current array.
    ///
    /// - parameter index: The index to test boundaries
    ///
    /// - returns: true if the index is out of bounds, otherwise, false
    ///
    func sfIsIndexOutOfBounds(index: Int) -> Bool {
        return ((index >= self.count) || (index < 0))
    }
    
    ///
    /// Tell if the given index is in the bounds of the current array.
    ///
    /// - parameter index: The index to test boundaries
    ///
    /// - returns: true if the index is in bounds, otherwise, false
    ///
    func sfIsIndexInBounds(index: Int) -> Bool {
        return ((index < self.count) && (index >= 0))
    }
}


extension Array {
    ///
    /// Telle if the given parameters is contained in the array
    ///
    /// - parameter obj: The searched object
    ///
    /// - returns: true if the array contains the object, else returns false.
    ///
    func contains<T : Equatable>(obj: T) -> Bool {
        return self.filter({$0 as? T == obj}).count > 0
    }
}

extension Array {
    ///
    /// Simple function that tell if the array is sorted. 
    /// Elements of the array should conform to the `Comparable` protocol.
    ///
    /// - returns: true if the array is sorted, else returns false.
    ///
    static func isSortedAscendingly<T : Comparable>(items:Array<T>) -> Bool {
        for i in 1..<items.count {
            if (items[i-1] > items[i]) {
                return false
            }
        }
        return true
    }
}

