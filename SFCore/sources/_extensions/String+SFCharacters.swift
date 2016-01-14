//
//  █████╗ ██╗   ██╗██╗██╗   ██╗ █████╗     ███████╗██████╗  █████╗ ███╗   ██╗ ██████╗███████╗
// ██╔══██╗██║   ██║██║██║   ██║██╔══██╗    ██╔════╝██╔══██╗██╔══██╗████╗  ██║██╔════╝██╔════╝
// ███████║██║   ██║██║██║   ██║███████║    █████╗  ██████╔╝███████║██╔██╗ ██║██║     █████╗
// ██╔══██║╚██╗ ██╔╝██║╚██╗ ██╔╝██╔══██║    ██╔══╝  ██╔══██╗██╔══██║██║╚██╗██║██║     ██╔══╝
// ██║  ██║ ╚████╔╝ ██║ ╚████╔╝ ██║  ██║    ██║     ██║  ██║██║  ██║██║ ╚████║╚██████╗███████╗
// ╚═╝  ╚═╝  ╚═══╝  ╚═╝  ╚═══╝  ╚═╝  ╚═╝    ╚═╝     ╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═══╝ ╚═════╝╚══════╝
//
//  SFCore : String+SFCharacters.swift
//
//  Created by Samuel Grau on 02/03/2015.
//  Copyright (c) 2015 Samuel Grau. All rights reserved.
//

import Foundation

///
///
///
public extension String {

  ///
  /// Returns the representation of the character at position `i`
  /// in the string
  ///
  /// - parameter i: the index of the wanted character
  ///
  /// - returns: The string describing the character at index `i`.
  ///
  public func getCharacter(i: Int) -> Character {
    return self[self.startIndex.advancedBy(i)]
  }

  ///
  /// Returns the representation of the character at position `i`
  /// in the string
  ///
  /// - parameter i: the index of the wanted character
  ///
  /// - returns: The string describing the character at index `i`.
  ///
  public subscript (i: Int) -> String {
    return String(self.getCharacter(i) as Character)
  }

  ///
  ///
  ///
  public func characterString(i: Int) -> String {
    return self[i] //String(self.getCharacter(i) as Character)
  }
}

public extension String {
  public var capitalizeFirst: String {
    var result = self
    result.replaceRange(startIndex...startIndex, with: String(self[startIndex]).capitalizedString)
    return result
  }

  public var trim: String {
    return self.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())
  }
}
