//
//  Double+ShortHands.swift
//  SFCore
//
//  Created by Samuel Grau on 28/01/2016.
//  Copyright © 2016 Samuel Grau. All rights reserved.
//

import Foundation

// MARK: - Rounded Values

extension Double {
  
  /**
   Rounds the double to decimal places value
   
   - parameter places: number of wanted decimals
   
   - returns: The rounded value of the double
   */
  public func roundToPlaces(places: Int) -> Double {
    let divisor = 10^Double(places)
    return round(self * divisor) / divisor
  }
}

infix operator ^ { associativity left precedence 170 }

/**
 The operator that powers two Double
 
 - parameter num:   the number to exponentiate
 - parameter power: the power exponent
 
 - returns: returns num^power
 */
public func ^ (num: Double, power: Double) -> Double {
  return pow(num, power)
}
