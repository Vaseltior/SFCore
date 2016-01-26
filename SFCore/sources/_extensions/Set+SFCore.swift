//
//  Set+Extensions.swift
//  Expertise-Grele
//
//  Created by Samuel Grau on 26/01/2016.
//  Copyright © 2016 Aviva France. All rights reserved.
//

import Foundation

///
/// Adding the map behavior to the Sets
///
extension Set {
  /**
   Transforms a set as an array would do applying the map function

   - parameter transform: the transformation closure to apply to the original set

   - returns: the result set transformed by tranform
   */
  public func map<U>(transform: (Element) -> U) -> Set<U> {
    return Set<U>(self.map(transform))
  }
}
