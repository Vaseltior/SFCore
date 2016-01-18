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
//  SFCore : String+SFCharacters.swift
//
//  Created by Samuel Grau on 02/03/2015.
//  Copyright (c) 2015 Samuel Grau. All rights reserved.
//

import Foundation

extension String {
  ///
  /// Returns the representation of the character at position `i`
  /// in the string
  ///
  /// - parameter i: the index of the wanted character
  ///
  /// - returns: The string describing the character at index `i`.
  ///
  public func getCharacter(index: Int) -> Character {
    return self[self.startIndex.advancedBy(index)]
  }

  ///
  /// Returns the representation of the character at position `i`
  /// in the string
  ///
  /// - parameter i: the index of the wanted character
  ///
  /// - returns: The string describing the character at index `i`.
  ///
  public subscript (index: Int) -> String {
    return String(self.getCharacter(index) as Character)
  }

  ///
  ///
  ///
  public func characterString(index: Int) -> String {
    return self[index] //String(self.getCharacter(i) as Character)
  }

  public var capitalizeFirst: String {
    var result = self
    result.replaceRange(startIndex...startIndex, with: String(self[startIndex]).capitalizedString)
    return result
  }

  public var trim: String {
    return self.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())
  }
}
