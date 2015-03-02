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
//  SFCore : SFSet.swift
//
//  Created by Samuel Grau on 02/03/2015.
//  Copyright (c) 2015 Samuel Grau. All rights reserved.
//

import Foundation

struct SFSet<T: Hashable> {
    typealias Index = T
    private var dictionary: [T: Bool] = [:]
    
    var count: Int {
        return self.dictionary.count
    }
    
    var isEmpty: Bool {
        return self.dictionary.isEmpty
    }
    
    func contains(element: T) -> Bool {
        return self.dictionary[element] ?? false
    }
    
    mutating func put(element: T) {
        self.dictionary[element] = true
    }
    
    mutating func remove(element: T) -> Bool {
        if self.contains(element) {
            self.dictionary.removeValueForKey(element)
            return true
        } else {
            return false
        }
    }
}

extension SFSet: ArrayLiteralConvertible {
    internal init(arrayLiteral elements: T...) {
        for element in elements {
            put(element)
        }
    }
}
